Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'usuarioCreador',
		'fecha',
		'hora',
		'likes'
	],
	#category : #'Objetos2-primerEntrega'
}

{ #category : #'as yet unclassified' }
Interaccion >> agregarLike: unUsuario [
	
	likes add: (Like initializeConUsuario: unUsuario).
]

{ #category : #'as yet unclassified' }
Interaccion >> getDislikes [
	^ (likes collect: [ :each | each getState = false ]) size
]

{ #category : #'as yet unclassified' }
Interaccion >> getLikes [
	^ (likes collect: [ :each | each getState]) size
]

{ #category : #initialization }
Interaccion >> initialize [
	likes := OrderedCollection new.
	fecha := Date today.
	hora := Time now
]

{ #category : #'as yet unclassified' }
Interaccion >> usuarioPropietario [
	^ usuarioCreador 
]
