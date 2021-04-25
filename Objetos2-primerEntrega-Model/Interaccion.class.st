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

{ #category : #'as yet unclassified' }
Interaccion >> agregarDislike: unUsuario [
	"Chequea si existe alguna reaccion del usuario a la pregunta/respuesta correspondiente.
	Si existe, la quita y le cambia el estado.
	Si no existe solo la crea "

	(self existeInteraccion: unUsuario)
		ifTrue: [ self quitarReaccion: unUsuario ].
	self aplicarReaccion: unUsuario estado: false.
]

{ #category : #adding }
Interaccion >> agregarLike: unUsuario [
	"Chequea si existe alguna reaccion del usuario a la pregunta/respuesta correspondiente.
	Si existe, la quita y le cambia el estado.
	Si no existe solo la crea "

	(self existeInteraccion: unUsuario)
		ifTrue: [ self quitarReaccion: unUsuario ].
	self aplicarReaccion: unUsuario estado: true.
]

{ #category : #'as yet unclassified' }
Interaccion >> aplicarReaccion: unUsuario estado:unBoolean [
	| like |
	like := Like initializeConUsuario: unUsuario like: unBoolean.
	likes add: like
]

{ #category : #acccessing }
Interaccion >> cantidadDislikes [
	^ (likes reject: [ :each | each estado ]) size
]

{ #category : #acccessing }
Interaccion >> cantidadLikes [
	^ (likes select: [ :each | each estado ]) size
]

{ #category : #'as yet unclassified' }
Interaccion >> coleccionDeDislikes [
	^ self getReacciones
		reject: [ :reaccion | reaccion getState ]
]

{ #category : #'as yet unclassified' }
Interaccion >> coleccionDeLikes [
	^ self getReacciones
		collect: [ :reaccion | reaccion getState  ]
]

{ #category : #'as yet unclassified' }
Interaccion >> dislikesDeUnUsuario: unUsuario [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Interaccion >> esDeUnUsuario: unUsuario [
	"Dice si la respuesta de de dicho usuario"

	^(self usuarioPropietario == unUsuario)
		
]

{ #category : #'as yet unclassified' }
Interaccion >> existeInteraccion: unUsuario [
	"Chequea si existe la interaccion del usuario"

	^ likes anySatisfy: [ :like | like usuario == unUsuario ]
]

{ #category : #'as yet unclassified' }
Interaccion >> fechaYHora [
	^ fechaYHora
]

{ #category : #initialization }
Interaccion >> initialize [
	likes := OrderedCollection new.
	fechaYHora := DateAndTime now.

]

{ #category : #'as yet unclassified' }
Interaccion >> likesDeUnUsuario: unUsuario [
	self subclassResponsibility
]

{ #category : #'as yet unclassified' }
Interaccion >> quitarReaccion: unUsuario [
	"Quita la reaccion del usuario"

	likes
		remove: (likes detect: [ :like | like usuario == unUsuario ])
]

{ #category : #'as yet unclassified' }
Interaccion >> reacciones [
	^ likes
]

{ #category : #'as yet unclassified' }
Interaccion >> reaccionesDeUnUsuario: unUsuario [
	^ self reacciones
		select: [ :reaccion | reaccion esDeUnUsuario: unUsuario ]
]

{ #category : #acccessing }
Interaccion >> usuarioPropietario [
	^ usuarioCreador 
]
