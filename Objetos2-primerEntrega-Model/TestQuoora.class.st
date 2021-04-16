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
	| usuario1 usuario2 |
	usuario1 := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'SabeloBelo'.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Manuel2'
		password: 'SabeloBelo'.
	quoora agregarFollower: usuario2 usuario: usuario1.
	self assert: usuario1 getFollowers size equals: 1.
	self deny: usuario2 getFollowers size equals: 10
]

{ #category : #tests }
TestQuoora >> testAgregarPreguntaYLike [
	| topico usuario usuario2 pregunta |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topico := Topico
		nuevoConNombre: 'Deporte'
		descripcion: 'Todo sobre el deporte'.
	pregunta := quoora
		agregarPreguntaConTopico: topico
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Arturo'
		password: 'Sabelobelo'.
	self assert: (quoora getPreguntasDeUnUsuario: usuario) size equals: 1.
	self assert: (quoora getPreguntasConTopico: topico) size equals: 1.
	quoora agregarLikePregunta: pregunta usuario: usuario2.
	self assert: pregunta getLikes size equals: 1
]

{ #category : #tests }
TestQuoora >> testAgregarRespuesta [
	| topico usuario usuario2 pregunta |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Manuelo'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topico := Topico
		nuevoConNombre: 'Deporte'
		descripcion: 'Todo sobre el deporte'.
	pregunta := quoora
		agregarPreguntaConTopico: topico
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	quoora
		agregarRespuestaConPregunta: pregunta
		texto: 'Algo'
		usuario: usuario2.
	self assert: (quoora getRespuestas: pregunta) size equals: 1.
	self assert: (quoora getRespuestasDeUnUsuario: usuario2) size equals: 1.
]

{ #category : #tests }
TestQuoora >> testBorrarPregunta [
	| pregunta topico usuario |
	topico := Topico nuevoConNombre: 'Skate' descripcion: 'blabla'.
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'blabla'.
	pregunta := quoora
		agregarPreguntaConTopico: topico
		titulo: 'unTitulo'
		descripcion: 'blabla'
		usuario: usuario.
	self assert: (quoora getPreguntasConTopico: topico) size equals: 1.
	quoora borrarPregunta: pregunta.
	self deny: (quoora getPreguntasConTopico: topico) size equals: 1
]

{ #category : #tests }
TestQuoora >> testCalcularPuntajeDeUsuario [
	|usuario|
	usuario := quoora crearUsuarioNombre: 'Manuel' password: 'queseyo'.
	quoora agregarPreguntaConTopico: 'unostopicos' titulo: 'UnTitulo'  descripcion: 'UnaDescripcion'  usuario: usuario.
	self assert: (quoora calcularPuntajeDe: usuario) equals: 20
	
]

{ #category : #tests }
TestQuoora >> testCrearUsuario [
	| topico usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	quoora crearUsuarioNombre: 'Manuel' password: 'Sabelobelo'.
	topico := Topico
		nuevoConNombre: 'Deporte'
		descripcion: 'Todo sobre el deporte'.
	quoora
		agregarPreguntaConTopico: topico
		titulo: 'Pregunta?'
		descripcion: 'No se q describir'
		usuario: usuario.
	self assert: (quoora getPreguntasDeUnUsuario: usuario) size equals: 1.
	self assert: (quoora getPreguntasConTopico: topico) size equals: 1
]
