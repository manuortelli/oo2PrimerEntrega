Class {
	#name : #ComponentePregunta,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePregunta class >> of: unaPregunta [
	|instancia|
	instancia := self new.
	instancia inicializarCon: unaPregunta .
	^ instancia
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> inicializarCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #accessing }
ComponentePregunta >> pregunta [ 
	^pregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderButtonLike: aCanvas pregunta: unaPregunta [
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

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderContentOn: aCanvas [
	aCanvas anchor
		class: 'display-4';
		callback: [ aCanvas render: (ComponentePreguntaDetalle of: pregunta) ];
		with: self pregunta titulo.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre.
	self renderLikeOn: aCanvas.
	self renderButtonLike: aCanvas pregunta: self pregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderLikeOn: aCanvas [
	aCanvas anchor
		class: 'display-5';
		callback: [ self
				call: (aCanvas render: (ComponentePerfil of: pregunta usuarioPropietario)) ];
		with: 'Creado por: ' , self pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, pregunta cantidadLikes greaseString
]
