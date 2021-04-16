Class {
	#name : #Pregunta,
	#superclass : #Interaccion,
	#instVars : [
		'titulo',
		'descripcion',
		'topicos',
		'respuestas'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
Pregunta class >> nuevaPreguntaConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion topicos:unosTopicos [
	^ self new
		initializePreguntaConUsuario: unUsuario
		titulo: unTitulo
		descripcion: unaDescripcion
		topicos: unosTopicos
]

{ #category : #adding }
Pregunta >> agregarRespuestaConTexto: unTexto usuario: unUsuario [
	respuestas add: (Respuesta nuevaConTexto: unTexto usuario: unUsuario).
]

{ #category : #adding }
Pregunta >> agregarTopico: unTopico [
	topicos add: unTopico
]

{ #category : #accesing }
Pregunta >> getRespuestas [
	^ respuestas
]

{ #category : #accesing }
Pregunta >> getTopico [
	^ topicos 
]

{ #category : #accesing }
Pregunta >> getTopicoNombres [
	^ ', ' join: topicos
]

{ #category : #initialization }
Pregunta >> initializePreguntaConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [
	usuarioCreador := unUsuario.
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos := OrderedCollection new.
	topicos addAll: unosTopicos.
	respuestas := OrderedCollection new.
	likes := OrderedCollection new
]

{ #category : #accesing }
Pregunta >> titulo [ 
	^titulo
]
