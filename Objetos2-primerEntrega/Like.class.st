Class {
	#name : #Like,
	#superclass : #Object,
	#instVars : [
		'estado',
		'fecha',
		'hora',
		'usuario'
	],
	#category : #'Objetos2-primerEntrega'
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
	fecha := Date today.
	hora := Time now.
]

{ #category : #initialization }
Like >> initializeConUsuario: unUsuario [
	usuario:=unUsuario.
	estado := true.
	fecha := Date today.
	hora := Time now
]

{ #category : #initialization }
Like >> setState [
	estado := estado not.
	fecha := Date today.
	hora := Time now.
]
