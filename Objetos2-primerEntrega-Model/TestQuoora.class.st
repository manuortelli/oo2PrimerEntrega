Class {
	#name : #TestQuoora,
	#superclass : #TestCase,
	#instVars : [
		'quoora'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestQuoora >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	quoora:= Quoora new.
	
]

{ #category : #tests }
TestQuoora >> testAgregarFollower [
	| usuario1 usuario2 usuario3|
	usuario1 := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'SabeloBelo'.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Manuel2'
		password: 'SabeloBelo'.
	usuario1 agregarFollower: usuario2.
	self assert: usuario1 followers size equals: 1.
	self deny: usuario2 followers size equals: 10.
		usuario3 := UsuarioQuoora
		initializeConNombre: 'Manuel2'
		password: 'SabeloBelo'.
	self deny: usuario2 followers size equals: 1.
	usuario1 agregarFollower: usuario3.
			self assert: usuario1 followers size equals: 2.
	
]

{ #category : #tests }
TestQuoora >> testAgregarPreguntaYLike [
	| topicos topico usuario usuario2 pregunta |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topicos := OrderedCollection new.
	topico := Topico
		nuevoConNombre: 'topico1'
		descripcion: 'Todo sobre el deporte'.
	topicos add: topico.
	pregunta := quoora
		agregarPreguntaConTopico: topicos
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Arturo'
		password: 'Sabelobelo'.
	self assert: (quoora preguntasDeUnUsuario: usuario) size equals: 1.
	self assert: (quoora preguntasConTopico: topico) size equals: 1.
	pregunta agregarLike: usuario2.
	self assert: pregunta cantidadLikes equals: 1
]

{ #category : #tests }
TestQuoora >> testAgregarRespuesta [
	| topico usuario usuario2 pregunta topicos |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Arturo'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topico := Topico
		nuevoConNombre: 'Deporte'
		descripcion: 'Todo sobre el deporte'.
	topicos := OrderedCollection new.
	topicos add: topico.
	pregunta := quoora
		agregarPreguntaConTopico: topicos
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	pregunta agregarRespuestaConTexto: 'Algo' usuario: usuario2.
	self assert: pregunta respuestas size equals: 1.
	self assert: (quoora respuestasDeUnUsuario: usuario2) size equals: 1
]

{ #category : #tests }
TestQuoora >> testBorrarPregunta [
	| pregunta topico1 topico2 usuario topicos  |
	topico1 := Topico nuevoConNombre: 'Skate' descripcion: 'blabla'.
	topico2 := Topico nuevoConNombre: 'Futbol' descripcion: 'El rey del futbol'.
	topicos := OrderedCollection new.
	topicos add: topico1; add:topico2.
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'blabla'.
	pregunta := quoora
		agregarPreguntaConTopico: topicos
		titulo: 'unTitulo'
		descripcion: 'blabla'
		usuario: usuario.
	self assert: (quoora preguntasConTopico: topico1) size equals: 1.
	quoora borrarPregunta: pregunta.
	self deny: (quoora preguntasConTopico: topico1) size equals: 1
]

{ #category : #tests }
TestQuoora >> testCalcularPuntajeDeUsuario [
	| usuario pregunta |
	usuario := quoora crearUsuarioNombre: 'Manuel' password: 'queseyo'.
	pregunta := quoora
		agregarPreguntaConTopico: 'unostopicos'
		titulo: 'UnTitulo'
		descripcion: 'UnaDescripcion'
		usuario: usuario.
	self assert: (quoora calcularPuntajeDe: usuario) equals: 20.
	pregunta agregarLike: usuario.
	self assert: (quoora calcularPuntajeDe: usuario) equals: 21.
	pregunta agregarDislike: usuario.
	self assert: (quoora calcularPuntajeDe: usuario) equals: 19
]

{ #category : #tests }
TestQuoora >> testCrearUsuario [
	| topicos usuario topico |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topicos := OrderedCollection new.
	topico := Topico
		nuevoConNombre: 'Deporte'
		descripcion: 'Todo sobre el deporte'.
	topicos add: topico.
	quoora
		agregarPreguntaConTopico: topicos
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	self assert: (quoora preguntasDeUnUsuario: usuario) size equals: 1.
	self assert: (quoora preguntasConTopico: topico) size equals: 1
]

{ #category : #tests }
TestQuoora >> testObtenerCincoPreguntasRelevantes [
	| usuario1 topicos topico1 topico2 preguntaPrueba setDePreguntas|
	topicos := OrderedCollection new.
	setDePreguntas := Set new.
	usuario1 := quoora crearUsuarioNombre: 'arturo' password: '123'.
	topico2 := Topico
		nuevoConNombre: 'Motos'
		descripcion: 'La ax100 una maquina'.
	topico1 := Topico
		nuevoConNombre: 'Simpson'
		descripcion: 'La descripcion de la tele'.
	topicos
		add: topico1;
		add: topico2.
	preguntaPrueba := quoora
		agregarPreguntaConTopico: topicos
		titulo: 'La pregunta del los simpson?'
		descripcion: 'Algo de la tele'
		usuario: usuario1.
	setDePreguntas add: preguntaPrueba.
	usuario1
		agregarTopicoDeinteres: 'Simpson'
		unaDescripcion: 'La cheta descripcion'.
	self
		assert: (quoora obtenerCincoPreguntasRelevantes: usuario1) size
		equals: 1.
	self
		assert: (quoora obtenerCincoPreguntasRelevantes: usuario1) equals: setDePreguntas .
	quoora
		agregarPreguntaConTopico: topicos
		titulo: 'Estan buenas las 2 tiempos?'
		descripcion: 'Foro de motos'
		usuario: usuario1.
	self
		assert: (quoora obtenerCincoPreguntasRelevantes: usuario1) size
		equals: 2
]
