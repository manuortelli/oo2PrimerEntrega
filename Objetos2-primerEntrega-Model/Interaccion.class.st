Class {
	#name : #Interaccion,
	#superclass : #Object,
	#instVars : [
		'usuarioCreador',
		'fechaYHora',
		'likes'
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
Interaccion >> coleccionDeDislikes [
	^ self getReacciones collect:[:reaccion | reaccion getState==false]
]

{ #category : #'as yet unclassified' }
Interaccion >> coleccionDeLikes [
	^ self getReacciones
		collect: [ :reaccion | reaccion getState  ]
]

{ #category : #'as yet unclassified' }
Interaccion >> esDeUnUsuario: unUsuario [
	"Dice si la respuesta de de dicho usuario"

	self usuarioPropietario == unUsuario
		ifTrue: [ ^ true ].
	^ false
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
	^ (likes reject:  [ :each | each getState]) size
]

{ #category : #'as yet unclassified' }
Interaccion >> getDislikesDeUnUsuario: unUsuario [
	
]

{ #category : #'as yet unclassified' }
Interaccion >> getFechaYHora [
	^ fechaYHora 
]

{ #category : #acccessing }
Interaccion >> getLikes [
	^ (likes select: [ :each | each getState ]) size
]

{ #category : #'as yet unclassified' }
Interaccion >> getLikesDeUnUsuario: unUsuario [
	self subclassResponsibility 
]

{ #category : #'as yet unclassified' }
Interaccion >> getReacciones [
	^ likes
]

{ #category : #'as yet unclassified' }
Interaccion >> getReaccionesDeUnUsuario: unUsuario [
	^ self getReacciones
		select: [ :reaccion | reaccion esDeUnUsuario: unUsuario ]
]

{ #category : #acccessing }
Interaccion >> getRespuestas [ 
	self subclassResponsibility
]

{ #category : #initialization }
Interaccion >> initialize [
	likes := OrderedCollection new.
	fechaYHora := DateAndTime now.

]

{ #category : #'as yet unclassified' }
Interaccion >> quitarReaccion: unUsuario [
	"Quita la reaccion del usuario"

	likes
		remove: (likes detect: [ :like | like usuarioDeLike == unUsuario ])
]

{ #category : #acccessing }
Interaccion >> usuarioPropietario [
	^ usuarioCreador 
]
