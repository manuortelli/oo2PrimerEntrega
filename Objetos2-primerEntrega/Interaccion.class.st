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

{ #category : #adding }
Interaccion >> agregarLike: unUsuario [
	
	likes add: (Like initializeConUsuario: unUsuario).
]

{ #category : #adding }
Interaccion >> agregarRespuestaConTexto:unTexto usuario: unUsuario [ 
	self subclassResponsibility 
]

{ #category : #acccessing }
Interaccion >> getDislikes [
	^ (likes collect: [ :each | each getState = false ]) size
]

{ #category : #acccessing }
Interaccion >> getLikes [
	^ (likes collect: [ :each | each getState]) size
]

{ #category : #initialization }
Interaccion >> initialize [
	likes := OrderedCollection new.
	fecha := Date today.
	hora := Time now
]

{ #category : #acccessing }
Interaccion >> usuarioPropietario [
	^ usuarioCreador 
]
