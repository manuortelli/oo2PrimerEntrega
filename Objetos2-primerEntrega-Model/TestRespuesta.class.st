Class {
	#name : #TestRespuesta,
	#superclass : #TestCase,
	#instVars : [
		'respuesta'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestRespuesta >> setUp [
	respuesta := Respuesta nuevaConTexto: 'La respuesta magica' usuario: 'Poxy1' 

	
]

{ #category : #tests }
TestRespuesta >> testDislikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	respuesta agregarDislike: usuario.
	self assert: respuesta reacciones size equals: 1.
	self assert: (respuesta reacciones at: 1) estado equals: false.
	self assert: (respuesta dislikesDeUnUsuario: usuario) equals: 1.
	respuesta agregarLike: usuario.
	self assert: respuesta reacciones size equals: 1.
	self assert: (respuesta reacciones at: 1) estado equals: true.
	self assert: (respuesta dislikesDeUnUsuario: usuario) equals: 0
]

{ #category : #tests }
TestRespuesta >> testLikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	respuesta agregarLike: usuario.
	self assert: respuesta reacciones size equals: 1.
	self assert: (respuesta likesDeUnUsuario: usuario) equals: 1.
	self assert: (respuesta dislikesDeUnUsuario: usuario) equals: 0.
	respuesta agregarDislike: usuario.
	self assert: respuesta reacciones size equals: 1.
	self assert: (respuesta reacciones at: 1) estado equals: false.
	self assert: (respuesta likesDeUnUsuario: usuario) equals: 0
]
