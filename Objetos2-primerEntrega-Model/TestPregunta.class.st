Class {
	#name : #TestPregunta,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Model-Test'
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
	pregunta agregarLike: usuario.
	self assert: pregunta cantidadLikes equals: 1.
	self assert: pregunta cantidadDislikes equals: 0.
	self assert: pregunta reacciones size equals: 1.
	pregunta agregarLike: usuario.
	self assert: pregunta cantidadLikes equals: 1.
	self assert: pregunta cantidadDislikes equals: 0.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta reacciones at: 1) estado equals: true.
	pregunta agregarDislike: usuario.
	self assert: pregunta cantidadLikes equals: 0.
	self assert: pregunta cantidadDislikes equals: 1.
	self assert: pregunta reacciones size equals: 1.
	pregunta agregarDislike: usuario.
	self assert: pregunta cantidadLikes equals: 0.
	self assert: pregunta cantidadDislikes equals: 1.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta reacciones at: 1) estado equals: false
]

{ #category : #tests }
TestPregunta >> testAgregarRespuestaConTexto [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta
		agregarRespuestaConTexto: 'La respuesta esperada por todos'
			usuario: usuario;
		agregarRespuestaConTexto: 'Esa respuesta no era la que esperaba'
			usuario: usuario.
	self assert: pregunta respuestas size equals: 2.
	pregunta
		agregarRespuestaConTexto: 'La verdad que podrias esforzarte mas en un respuesta clara'
		usuario: usuario.
	self deny: pregunta respuestas size equals: 2.
	self assert: pregunta respuestas size equals: 3.
]

{ #category : #tests }
TestPregunta >> testDislikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarDislike: usuario.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta dislikesDeUnUsuario: usuario) equals: 1.
	self assert: (pregunta likesDeUnUsuario: usuario) equals: 0.
	pregunta agregarLike: usuario.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta dislikesDeUnUsuario: usuario) equals: 0.
	self assert: (pregunta likesDeUnUsuario: usuario) equals: 1
]

{ #category : #tests }
TestPregunta >> testExisteInteraccion [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario.
	self assert: (pregunta existeInteraccion: usuario) equals: true
]

{ #category : #tests }
TestPregunta >> testlikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta likesDeUnUsuario: usuario) equals: 1.
	self assert: (pregunta dislikesDeUnUsuario: usuario) equals: 0.
	self assert: pregunta cantidadLikes equals:1.
	pregunta agregarDislike: usuario.
	self assert: pregunta reacciones size equals: 1.
	self assert: (pregunta likesDeUnUsuario: usuario) equals: 0.
	self assert: pregunta cantidadLikes equals:0.
	self assert: pregunta cantidadDislikes equals:1.
]
