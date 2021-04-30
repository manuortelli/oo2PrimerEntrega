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
ComponentePreguntaDetalle class >> of: unaPregunta [
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
	self renderLogoutButtonOn: aCanvas.
	self volverAHome:aCanvas
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
	aCanvas render: (ComponentePost of: self pregunta).
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderRespuesta: aCanvas pregunta: unaPregunta [
	aCanvas unorderedList
		with: [ unaPregunta respuestas
				do:
					[ :respuesta | aCanvas listItem: [ aCanvas render: (ComponenteRespuesta  of: respuesta) ] ] ]
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> volverAHome:aCanvas [
	aCanvas submitButton
		class: 'btn btn-outline-secondary';
		callback: [ self call: ComponenteInicial new ];
		with: 'Volver'.
]
