Class {
	#name : #ComponentePreguntaDetalle,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePreguntaDetalle class >> of: pregunta [
	|instancia|
	instancia := self new.
	^ instancia inicialializadaCon: pregunta.
	
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> inicialializadaCon: unaPregunta [
	pregunta := unaPregunta 
]

{ #category : #rendering }
ComponentePreguntaDetalle >> pregunta [ 
	^pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderContentOn: aCanvas [
	self renderDetalle: aCanvas 
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
	aCanvas paragraph 
		with: self pregunta titulo greaseString	
	aCanvas unorderedList
		with: [ self pregunta getRespuestas
				do: [ :respuesta | 
					aCanvas
						listItem: [ aCanvas heading level3 with: 'Respuesta:  '.
							respuesta getRespuestas ] ] ]
]
