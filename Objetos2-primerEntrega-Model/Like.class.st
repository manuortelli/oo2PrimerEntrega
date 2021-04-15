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
Like class >> initializeConUsuario: unUsuario [
	^ self new initializeConUsuario: unUsuario
]

{ #category : #'as yet unclassified' }
Like >> getState [ 
	^ estado 
]

{ #category : #initialization }
Like >> initialize [
	estado := true.
	fechaYHora := DateAndTime now
	
]

{ #category : #initialization }
Like >> initializeConUsuario: unUsuario [
	usuario := unUsuario.
	estado := true.
	fechaYHora := DateAndTime now.
]

{ #category : #initialization }
Like >> setState [
	estado := estado not.
	fechaYHora := DateAndTime now
]
