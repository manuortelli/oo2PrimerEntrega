Class {
	#name : #UsuarioQuoora,
	#superclass : #Object,
	#instVars : [
		'nombreDeUsuario',
		'password',
		'fechaYHora',
		'topicosDeInteres',
		'followers',
		'preguntas'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
UsuarioQuoora class >> initializeConNombre: unNombre password: unaPassword [
	^ self new initializeConNombre: unNombre password: unaPassword.
]

{ #category : #adding }
UsuarioQuoora >> agregarFollower: unFollower [
	followers add: unFollower.
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> agregarPregunta: unaPregunta [
	preguntas add: unaPregunta
]

{ #category : #adding }
UsuarioQuoora >> agregarTopicoDeinteres: unTopico [
	topicosDeInteres add: unTopico
]

{ #category : #accessing }
UsuarioQuoora >> getFollowers [
	^ followers 
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> getPreguntas [
	^ preguntas
]

{ #category : #initialization }
UsuarioQuoora >> initializeConNombre: unNombre password: unaPassword [
	nombreDeUsuario := unNombre.
	password := unaPassword.
	topicosDeInteres := Set new.
	followers := Set new.
	preguntas:= Set new.
	fechaYHora := DateAndTime now
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> name [
	^ nombreDeUsuario
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> nombreUsuario [
	^ nombreDeUsuario 
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> password [ 
	^password 
]

{ #category : #accessing }
UsuarioQuoora >> topicosDeInteres [
	^ topicosDeInteres 
]
