Class {
	#name : #ComponentePregunta,
	#superclass : #ComponenteNuevoTopico,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponentePregunta class >> initializeCon: unaPregunta [
	  ^ self initializeCon: unaPregunta 
]

{ #category : #initialization }
ComponentePregunta >> initializeCon: unaPregunta [
	pregunta := unaPregunta 
]

{ #category : #accessing }
ComponentePregunta >> renderContentOn: aCanvas [
]

{ #category : #accessing }
ComponentePregunta >> renderPregunta: aCanvas [
	aCanvas with: pregunta titulo.
	aCanvas heading level5 with: 'Topico: ' , pregunta getTopicoNombre.
	aCanvas heading level5
		with:
			'like: ' , pregunta getLikes greaseString , ' Dislike:  '
				, pregunta getDislikes greaseString.
	super renderButtonLike: aCanvas pregunta: pregunta
]
