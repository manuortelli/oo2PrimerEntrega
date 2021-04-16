Class {
	#name : #Respuesta,
	#superclass : #Interaccion,
	#instVars : [
		'texto',
		'respuestas'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #adding }
Respuesta class >> nuevaConTexto: unTexto usuario:unUsuario [
	^ self new initializeConTexto: unTexto usuario: unUsuario.
]

{ #category : #adding }
Respuesta >> agregarRespuestaConTexto: unTexto usuario: unUsuario [
	respuestas
		add: (Respuesta nuevaConTexto: unTexto usuario: unUsuario)
]

{ #category : #'as yet unclassified' }
Respuesta >> esDeUnUsuario: unUsuario [
	"Dice si la respuesta de de dicho usuario"
	self usuarioPropietario == unUsuario
		ifTrue: [ ^ true ].
	^ false
]

{ #category : #'as yet unclassified' }
Respuesta >> getDislikesDeUnUsuario: unUsuario [
	^ (self getReacciones
		collect:
			[ :reaccion | reaccion usuarioPropietario == unUsuario & (reaccion getState == false) ])
		size
]

{ #category : #'as yet unclassified' }
Respuesta >> getLikesDeUnUsuario: unUsuario [
	^ (self getReacciones
		collect: [ :reaccion | reaccion usuarioPropietario == unUsuario & (reaccion getState) ])
		size
]

{ #category : #initialization }
Respuesta >> initializeConTexto: unTexto usuario:unUsuario [
	texto:=unTexto.
	usuarioCreador := unUsuario .
	respuestas := OrderedCollection new.
]
