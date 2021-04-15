Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'usuarioCreador',
		'fechaYHora',
		'likes',
		'dislikesCont',
		'likesCont'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #adding }
Interaccion >> agregarLike: unUsuario estado: unBoolean [
	"Chequea si existe alguna reaccion del usuario a la pregunta/respuesta correspondiente.
	Si existe, la quita y le cambia el estado.
	Si no existe solo la crea "

	(self existeInteraccion: unUsuario)
		ifTrue: [ self quitarReaccion: unUsuario ].
	self aplicarReaccion: unUsuario estado: unBoolean
]

{ #category : #adding }
Interaccion >> agregarRespuestaConTexto:unTexto usuario: unUsuario [ 
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Interaccion >> aplicarReaccion: unUsuario estado:unBoolean [
	| like |
	like := Like initializeConUsuario: unUsuario like: unBoolean.
	likes add: like
]

{ #category : #'as yet unclassified' }
Interaccion >> existeInteraccion: unUsuario [
	"chequea si existe la interaccion del usuario"

	likes
		detect: [ :like | like usuarioDeLike == unUsuario ]
		ifNone: [ ^ false ].
	^ true
]

{ #category : #acccessing }
Interaccion >> getDislikes [
	^ (likes select: [ :each | each getState == false ]) size
]

{ #category : #acccessing }
Interaccion >> getLikes [
	^ (likes select: [ :each | each getState == true ]) size
]

{ #category : #'as yet unclassified' }
Interaccion >> getReacciones [
	^ likes
]

{ #category : #initialization }
Interaccion >> initialize [
	likes := OrderedCollection new.
	fechaYHora := DateAndTime now.
	dislikesCont:= 0.
	likesCont:=0.
]

{ #category : #'as yet unclassified' }
Interaccion >> quitarReaccion: unUsuario [ 
	"Quita la reaccion del usuario"

	
	likes
		remove: (likes detect: [ :like | like usuarioDeLike = unUsuario ])
]

{ #category : #'as yet unclassified' }
Interaccion >> quitarReaccion: unUsuario estado:unBoolean [
	"Quita la reaccion del usuario"
	unBoolean
		ifTrue: [ likesCont := likesCont - 1 ]
		ifFalse: [ dislikesCont := dislikesCont - 1 ].
	likes
		remove: (likes detect: [ :like | like usuarioDeLike = unUsuario ])
]

{ #category : #acccessing }
Interaccion >> usuarioPropietario [
	^ usuarioCreador 
]
