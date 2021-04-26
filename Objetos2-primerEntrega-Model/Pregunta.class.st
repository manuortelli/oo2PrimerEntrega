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
		collect: [ :respuesta | respuesta esDeUnUsuario: unUsuario ]) size
]

{ #category : #'as yet unclassified' }
Pregunta >> contieneTopico: unTopico [
	"Consulta si unTopico , el cual es el nombre del topico es igual algun nombre de los topicos de la pregunta."
	^ self topicos anySatisfy: [ :topico | topico = unTopico ]
]

{ #category : #'as yet unclassified' }
Pregunta >> dislikesDeUnUsuario: unUsuario [
	"Devuleve la cantidad de dislikes de un usuario determinado"

	^ ((self reaccionesDeUnUsuario: unUsuario)
		reject: [ :reaccion | reaccion estado ]) size
		+
			(self respuestas
				collect: [ :respuesta | respuesta dislikesDeUnUsuario: unUsuario ])
				size
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

{ #category : #'as yet unclassified' }
Pregunta >> likesDeUnUsuario: unUsuario [
	"Devuleve la cantidad de likes de un usuario determinado"

	^ ((self reaccionesDeUnUsuario: unUsuario)
		select: [ :reaccion | reaccion estado ]) size
		+
			(self respuestas
				collect: [ :respuesta | respuesta likesDeUnUsuario: unUsuario ])
				size
]

{ #category : #accesing }
Pregunta >> respuestas [
	"Retornan todas las respuestas ordenadas de mayor a menor por cantidad mayor puntaje, el que está dado por la diferencia de likes y dislikes."
	^ respuestas asSortedCollection: [ :a :b | a puntaje > b puntaje ]
]

{ #category : #accesing }
Pregunta >> titulo [ 
	^titulo
]

{ #category : #accesing }
Pregunta >> topicoNombre [
	|nombreTopicos|
	nombreTopicos := self topicos collect: [ :topico | topico nombre ].
	^ ', ' join: nombreTopicos
]

{ #category : #accesing }
Pregunta >> topicos [
	^ topicos
]
