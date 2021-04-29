Class {
	#name : #ComponentePreguntaDetalle,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePreguntaDetalle class >> of: unaPregunta [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	^ instancia
]

{ #category : #'instance creation' }
ComponentePreguntaDetalle class >> of: unaPregunta and: parent [ 
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	^ instancia
]

{ #category : #accessing }
ComponentePreguntaDetalle >> inicializarCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #accessing }
ComponentePreguntaDetalle >> pregunta [
	^pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderContentOn: aCanvas [
	self call:  (ComponentePerfil of: self pregunta ) .
	self renderDetalle: aCanvas.
	
	self renderRespuesta: aCanvas pregunta: pregunta
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
	aCanvas heading level3 with: self pregunta titulo.
	aCanvas heading level3
		with: 'Descripcion: ' , self pregunta descripcion.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre.
	aCanvas heading level4
		with: 'Creado por: ' , pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadLikes greaseString , ' Dislike:  '
				, self pregunta cantidadDislikes greaseString
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
