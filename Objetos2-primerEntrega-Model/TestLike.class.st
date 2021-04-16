Class {
	#name : #TestLike,
	#superclass : #TestCase,
	#instVars : [
		'test'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestLike >> setUp [
	test := Like initializeConUsuario: 'Carlitos23'

	
]

{ #category : #initialization }
TestLike >> testSetState [
	self assert: test getState.
	test setState.
	self deny: test getState
]
