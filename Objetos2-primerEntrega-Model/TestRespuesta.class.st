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
TestRespuesta >> testGetDislikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	respuesta agregarLike: usuario estado: false.
	self assert: respuesta getReacciones size equals: 1.
	self assert: (respuesta getReacciones at: 1) getState equals: false.
	self assert: (respuesta getDislikesDeUnUsuario: usuario) equals: 1.
	respuesta agregarLike: usuario estado: true.
	self assert: respuesta getReacciones size equals: 1.
	self assert: (respuesta getReacciones at: 1) getState equals: true.
	self assert: (respuesta getDislikesDeUnUsuario: usuario) equals: 0
]

{ #category : #tests }
TestRespuesta >> testGetLikesDeUnUsuario [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	respuesta agregarLike: usuario estado: true.
	self assert: respuesta getReacciones size equals: 1.
	self assert: (respuesta getLikesDeUnUsuario: usuario) equals: 1.
	self assert: (respuesta getDislikesDeUnUsuario: usuario) equals: 0.
	respuesta agregarLike: usuario estado: false.
	self assert: respuesta getReacciones size equals: 1.
	self assert: (respuesta getReacciones at: 1) getState equals: false.
	self assert: (respuesta getLikesDeUnUsuario: usuario) equals: 0
]
