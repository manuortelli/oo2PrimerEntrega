Class {
	#name : #Like,
	#superclass : #Object,
	#instVars : [
		'estado',
		'fechaYHora',
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
Like class >> initializeConUsuario: unUsuario like:unBoolean [
	^ self new initializeConUsuario: unUsuario like: unBoolean
]

{ #category : #'as yet unclassified' }
Like >> agregarDislike [
	estado := false.
]

{ #category : #'as yet unclassified' }
Like >> agregarLike [ 
	estado := true.
]

{ #category : #'as yet unclassified' }
Like >> getState [ 
	^ estado 
]

{ #category : #initialization }
Like >> initializeConUsuario: unUsuario like: unBoolean [
	usuario := unUsuario.
	fechaYHora := DateAndTime now.
	self getState
		ifNil: [ unBoolean
				ifTrue: [ self agregarLike ]
				ifFalse: [ self agregarDislike ] ]
]

{ #category : #initialization }
Like >> setState [
	estado := estado not.
	fechaYHora := DateAndTime now
]
