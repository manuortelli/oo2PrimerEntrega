Class {
	#name : #UsuarioQuoora,
	#superclass : #Object,
	#instVars : [
		'nombreDeUsuario',
		'password',
		'fechaYHora',
		'topicosDeInteres',
		'followers'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
UsuarioQuoora class >> initializeConNombre: unNombre password: unaPassword [
	^ self new initializeConNombre: unNombre password: unaPassword.
]

{ #category : #adding }
UsuarioQuoora >> agregarFollower: unFollower [
	"agrega un follower a la coleccion de followers del usuario logueado"

	( followers detect: [ :follower | followers = unFollower ])
		ifFalse: (followers add: unFollower)
]

{ #category : #adding }
UsuarioQuoora >> agregarTopicoDeinteres: unTopico [
	"agrega un topico de interes al usuario"
	topicosDeInteres add: unTopico
]

{ #category : #adding }
UsuarioQuoora >> agregarTopicoDeinteres: unTitulo unaDescripcion: unaDescripcion [
	"Crea y agrega un topico de interes al usuario"

	| unTopico |
	unTopico := Topico
		nuevoConNombre: unTitulo
		descripcion: unaDescripcion.
	topicosDeInteres add: unTopico
]

{ #category : #accessing }
UsuarioQuoora >> followers [
	^ followers
]

{ #category : #initialization }
UsuarioQuoora >> initializeConNombre: unNombre password: unaPassword [
	nombreDeUsuario := unNombre.
	password := unaPassword.
	topicosDeInteres := Set new.
	followers := Set new.
	fechaYHora := DateAndTime now
]

{ #category : #'as yet unclassified' }
UsuarioQuoora >> nombre [
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
