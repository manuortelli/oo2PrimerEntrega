Class {
	#name : #ComponentePreguntaDetalle,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'pregunta',
		'parent'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePreguntaDetalle class >> of: unaPregunta and: unParent [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	instancia parent: unParent.
	^ instancia
]

{ #category : #accessing }
ComponentePreguntaDetalle >> inicializarCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #accessing }
ComponentePreguntaDetalle >> parent [
	^parent
]

{ #category : #accessing }
ComponentePreguntaDetalle >> parent: unParent [
	parent:= unParent
]

{ #category : #accessing }
ComponentePreguntaDetalle >> pregunta [
	^pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderContentOn: aCanvas [
	self renderDetalle: aCanvas.
	self renderRespuesta: aCanvas pregunta: pregunta.
	aCanvas render: (ComponenteFormularioRespuesta of: pregunta).
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
	aCanvas render: (ComponentePost of: self pregunta).
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderRespuesta: aCanvas pregunta: unaPregunta [
"Renderiza el componente respuesta por cada una de las respuesta de la pregunta actual"
	aCanvas unorderedList
		with: [ unaPregunta respuestas
				do: [ :respuesta | 
					aCanvas
						listItem: [ aCanvas render: (ComponenteRespuesta of: respuesta) ] ] ]
]
