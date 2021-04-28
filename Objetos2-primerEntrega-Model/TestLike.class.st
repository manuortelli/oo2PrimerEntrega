Class {
	#name : #TestLike,
	#superclass : #TestCase,
	#instVars : [
		'test',
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestLike >> setUp [
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelo'.
	test := Like initializeConUsuario: usuario like: true.
]

{ #category : #tests }
TestLike >> testEsDeUnUsuario [
	self assert: (test esDeUnUsuario: usuario) equals: true
]
