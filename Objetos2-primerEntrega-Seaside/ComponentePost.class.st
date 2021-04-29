Class {
	#name : #ComponentePost,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePost class >> of: unaPregunta [
	|instancia|
	instancia := self new.
	instancia inicializarCon: unaPregunta .
	^ instancia
]

{ #category : #'as yet unclassified' }
ComponentePost >> inicializarCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #'as yet unclassified' }
ComponentePost >> mostrarPerfil [
	self call: (ComponentePerfil new)
]

{ #category : #accessing }
ComponentePost >> pregunta [ 
	^pregunta
]

{ #category : #rendering }
ComponentePost >> renderButtonLike: aCanvas pregunta: unaPregunta [
"Muestra 2 botones , de Dislike y de Like"
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ unaPregunta agregarLike: self session usuario ];
				with: 'Like'.
			aCanvas space.
			aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ unaPregunta agregarDislike: self session usuario ];
				with: 'Dislike' ]
]

{ #category : #accessing }
ComponentePost >> renderContentOn: aCanvas [
	self renderTituloOn: aCanvas.
	self renderPropietarioOn: aCanvas.
	self renderLikeOn: aCanvas.
	self renderButtonLike: aCanvas pregunta: self pregunta
]

{ #category : #rendering }
ComponentePost >> renderDetalleOn [
	self call: ComponentePreguntaDetalle new.
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
	aCanvas text: 'Creado por:  '.
	aCanvas anchor
		callback: [ self mostrarPerfil ];
		with: self pregunta usuarioPropietario nombre.

]

{ #category : #rendering }
ComponentePost >> renderTituloOn: aCanvas [
	aCanvas anchor
		class: 'display-4';
		callback: [ self call: ComponentePreguntaDetalle new. ];
		with: self pregunta titulo.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre
]
