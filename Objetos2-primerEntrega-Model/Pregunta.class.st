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

{ #category : #'as yet unclassified' }
Pregunta >> cantidadDeRespuestasDe: unUsuario [
	"Cantidad de respuestas que hizo un usuario, a otro usuario"

	^ (self getRespuestas
		collect: [ :respuesta | respuesta esDeUnUsuario: unUsuario])
		size
]

{ #category : #'as yet unclassified' }
Pregunta >> getDislikesDeUnUsuario: unUsuario [
	"Devuelve la cantidad de dislikes de un usuario"

	^ (self getReacciones
		collect: [ :reaccion | 
			(reaccion usuarioPropietario == unUsuario) & (reaccion getState
				== false) ]) size + self getRespuestas
		sumNumbers: [ :respuesta | respuesta getDislikesDeUnUsuario: unUsuario ]
]

{ #category : #'as yet unclassified' }
Pregunta >> getLikesDeUnUsuario: unUsuario [
	"Devuleve la cantidad de likes de un usuario determinado"

	^ (self getReacciones
		collect:
			[ :reaccion | (reaccion usuarioPropietario == unUsuario) & (reaccion getState) ])
		size + self getRespuestas
		sumNumbers: [ :respuesta | respuesta getLikesDeUnUsuario: unUsuario ]
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
Pregunta >> getTopicoNombre [
	^ ',' join: topicos
]

{ #category : #initialization }
Pregunta >> initializePreguntaConUsuario: unUsuario titulo: unTitulo descripcion: unaDescripcion topicos: unosTopicos [
	usuarioCreador := unUsuario.
	titulo := unTitulo.
	descripcion := unaDescripcion.
	topicos := OrderedCollection  new.
	topicos addAll: unosTopicos.
	respuestas := OrderedCollection new.
	likes := OrderedCollection new
]

{ #category : #accesing }
Pregunta >> titulo [ 
	^titulo
]
