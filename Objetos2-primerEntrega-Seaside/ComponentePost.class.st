Class {
	#name : #ComponentePost,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta',
		'parent'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePost class >> of: unaPregunta [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	^ instancia.
]

{ #category : #'instance creation' }
ComponentePost class >> of: unaPregunta and: unParent [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	instancia parent:  unParent.
	^ instancia
]

{ #category : #'as yet unclassified' }
ComponentePost >> inicializarCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #'as yet unclassified' }
ComponentePost >> mostrarPerfil [
	self parent
		call: (ComponentePerfil of: self pregunta usuarioPropietario)
]

{ #category : #accessing }
ComponentePost >> parent [
	^parent 
]

{ #category : #accessing }
ComponentePost >> parent: unParent [
	parent:= unParent
]

{ #category : #accessing }
ComponentePost >> pregunta [ 
	^pregunta
]

{ #category : #rendering }
ComponentePost >> renderButtonLike: aCanvas [ 
	"Muestra 2 botones , de Dislike y de Like"

	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self pregunta agregarLike: self session usuario ];
				with: 'Like'.
			aCanvas space.
			aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self pregunta agregarDislike: self session usuario ];
				with: 'Dislike' ]
]

{ #category : #accessing }
ComponentePost >> renderContentOn: aCanvas [
	self renderTituloOn: aCanvas.
	self renderPropietarioOn: aCanvas.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre.
	self renderLikeOn: aCanvas.
	self renderButtonLike: aCanvas 
]

{ #category : #'as yet unclassified' }
ComponentePost >> renderLikeOn: aCanvas [
		aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadLikes greaseString , ' Dislike:  '
				, pregunta cantidadDislikes greaseString
]

{ #category : #'as yet unclassified' }
ComponentePost >> renderPropietarioOn: aCanvas [
	aCanvas space.
	aCanvas text: 'Creado por:  '.
	
	aCanvas anchor
		callback: [  self mostrarPerfil ];
		with: self pregunta usuarioPropietario nombre
]

{ #category : #rendering }
ComponentePost >> renderTituloOn: aCanvas [
	aCanvas anchor
		class: 'display-4';
		callback: [ self parent isNotNil
				ifTrue: [self parent call: (ComponentePreguntaDetalle of: pregunta)] ];
		with: self pregunta titulo
]
