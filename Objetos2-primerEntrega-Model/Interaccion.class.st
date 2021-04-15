Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'usuarioCreador',
		'fecha',
		'hora',
		'likes'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #adding }
Interaccion >> agregarLike: unUsuario estado: unBoolean [
	likes add: (Like initializeConUsuario: unUsuario like: unBoolean)
]

{ #category : #adding }
Interaccion >> agregarRespuestaConTexto:unTexto usuario: unUsuario [ 
	self subclassResponsibility 
]

{ #category : #acccessing }
Interaccion >> getDislikes [
	^ (likes collect: [ :each | each getState = false ]) 
]

{ #category : #acccessing }
Interaccion >> getLikes [
	^ (likes collect: [ :each | each getState ])
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
