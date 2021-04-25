Class {
	#name : #ComponentePreguntaDetalle,
	#superclass : #ComponentePosteo,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #rendering }
ComponentePreguntaDetalle >> renderContentOn: aCanvas [
	self renderDetalle: aCanvas 
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
	aCanvas heading level3 with: self pregunta titulo greaseString.
	aCanvas heading level4 with: 'Topico: ' , pregunta topicoNombre.
	aCanvas heading level4
		with: 'Creado por: ' , pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, self pregunta cantidadLikes greaseString.
	self renderButtonLike: aCanvas pregunta: pregunta.
	self renderRespuesta: aCanvas pregunta: pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderLikeOn: aCanvas [
	aCanvas heading level4
		with: 'Creado por: ' , self pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, self pregunta cantidadLikes greaseString
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> renderRespuesta: aCanvas pregunta: unaPregunta [
	aCanvas unorderedList
		with: [ unaPregunta respuestas
				do: [ :respuesta | 
					aCanvas
						listItem: [ aCanvas heading level3 with: 'Respuesta:  '.
							respuesta texto ] ] ].
]
