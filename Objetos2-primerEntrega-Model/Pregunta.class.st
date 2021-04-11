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
Pregunta class >> nuevaPreguntaConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion [
	^ self new
		initializePreguntaConUsuario: unUsuario
		titulo: unTitulo
		descripcion: unaDescripcion

]

{ #category : #initialization }
Pregunta >> agregarLikeDe: unUsuario [
	| usuario |
	usuario := likes
		detect: [ :l | l equals: unUsuario ]
		ifNone: [ Like initializeConUsuario: unUsuario ].
		usuario setState
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

{ #category : #initialization }
Pregunta >> initializePreguntaConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion [
	usuarioCreador := unUsuario.
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos := Set new.
	respuestas := OrderedCollection new.
	likes := OrderedCollection new.
]

{ #category : #accesing }
Pregunta >> titulo [ 
	^titulo
]
