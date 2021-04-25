Class {
	#name : #ComponentePregunta,
	#superclass : #ComponentePosteo,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderContentOn: aCanvas [
	aCanvas anchor
		class: 'display-4';
		callback: [ aCanvas render: ComponentePreguntaDetalle ];
		with: self pregunta titulo.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre.
	self renderLikeOn: aCanvas.
	self renderButtonLike: aCanvas pregunta: self pregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderLikeOn: aCanvas [
	aCanvas heading level4
		with: 'Creado por: ' , self pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, pregunta cantidadLikes greaseString
]
