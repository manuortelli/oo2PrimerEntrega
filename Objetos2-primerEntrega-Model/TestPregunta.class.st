Class {
	#name : #TestPregunta,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestPregunta >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	|unosTopicos|
	unosTopicos:=Set new.
	unosTopicos add:'Basket'.
	pregunta := Pregunta
		nuevaPreguntaConUsuario: 'Carlos'
		titulo: 'Juegos de azar? '
		descripcion: 'Manejos en los juegos de azar'
		topicos: unosTopicos
]

{ #category : #tests }
TestPregunta >> testAgregarLike [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario estado: true.
	self assert: pregunta getLikes equals: 1.
	self assert: pregunta getDislikes equals: 0.
	self assert: pregunta getReacciones size equals: 1.
	pregunta agregarLike: usuario estado: true.
	self assert: pregunta getLikes equals: 1.
	self assert: pregunta getDislikes equals: 0.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getReacciones at: 1) getState equals: true.
	
	pregunta agregarLike: usuario estado: false.
	self assert: pregunta getLikes equals: 0.
	self assert: pregunta getDislikes equals: 1.
	self assert: pregunta getReacciones size equals: 1.
	pregunta agregarLike: usuario estado: false.
	self assert: pregunta getLikes equals: 0.
	self assert: pregunta getDislikes equals: 1.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getReacciones at: 1) getState equals: false
]

{ #category : #tests }
TestPregunta >> testAgregarRespuestaConTexto: unTexto unUsuario: usuario1 [
	pregunta
		agregarRespuestaConTexto: 'La respuesta esperada por todos'
			usuario: 'Carlitos23';
		agregarRespuestaConTexto: 'Esa respuesta no era la que esperaba'
			usuario: 'Poxy1'.
	self assert: pregunta getRespuestas size equals: 2.
	pregunta agregarRespuestaConTexto: 'La verdad que podrias esforzarte mas en un respuesta clara' usuario: 'Carlitos23'.
	self deny: pregunta getRespuestas size equals: 2.
]

{ #category : #tests }
TestPregunta >> testAgregarTopico [
	pregunta
		agregarTopico: 'Azar';
		agregarTopico: 'Juegos';
		agregarTopico: 'Motos'.
	self assert: pregunta getTopico size equals: 4.
	pregunta agregarTopico: 'Gatos'.
	self deny: pregunta getTopico size equals: 3
]

{ #category : #tests }
TestPregunta >> testExisteInteraccion [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario estado: true.
	self assert: (pregunta existeInteraccion: usuario) equals:true.
]

{ #category : #tests }
TestPregunta >> testGetDislikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario estado: false.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getDislikesDeUnUsuario: usuario) equals: 1.
	pregunta agregarLike: usuario estado:true.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getDislikesDeUnUsuario: usuario) equals: 0.
	
]

{ #category : #tests }
TestPregunta >> testGetLikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario estado: true.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getLikesDeUnUsuario: usuario) equals: 1.
	pregunta agregarLike: usuario estado: false.
	self assert: pregunta getReacciones size equals: 1.
	self assert: (pregunta getLikesDeUnUsuario: usuario) equals: 0
]
