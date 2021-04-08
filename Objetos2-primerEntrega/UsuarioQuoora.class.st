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
	#category : #'Objetos2-primerEntrega'
}

{ #category : #initialization }
UsuarioQuoora class >> initializeConNombre: unNombre password: unaPassword [
	^ self new initializeConNombre: unNombre password: unaPassword.
]

{ #category : #adding }
UsuarioQuoora >> agregarFollower: unFollower [
	followers add: unFollower.
]

{ #category : #adding }
UsuarioQuoora >> agregarTopicoDeinteres: unTopico [
	topicosDeInteres add: unTopico
]

{ #category : #accessing }
UsuarioQuoora >> getFollowers [
	^ followers 
]

{ #category : #initialization }
UsuarioQuoora >> initializeConNombre:unNombre password: unaPassword [
	nombreDeUsuario := unNombre.
	password := unaPassword.
	topicosDeInteres := Set new.
	followers := Set new.
]

{ #category : #accessing }
UsuarioQuoora >> topicosDeInteres [
	^ topicosDeInteres 
]
