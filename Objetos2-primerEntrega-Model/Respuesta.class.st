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

{ #category : #initialization }
Respuesta >> initializeConTexto: unTexto usuario:unUsuario [
	texto:=unTexto.
	usuarioCreador := unUsuario .
	respuestas := OrderedCollection new.
]
