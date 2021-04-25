Class {
	#name : #ComponentePosteo,
	#superclass : #SBSComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePosteo class >> of: unaPregunta [
	| posteo |
	posteo := self new.
	posteo inicializarCon: unaPregunta.
	^ posteo.
]

{ #category : #'as yet unclassified' }
ComponentePosteo >> inicializarCon: unaPregunta [
	pregunta:= unaPregunta 
]

{ #category : #accessing }
ComponentePosteo >> pregunta [ 	
	^pregunta
]

{ #category : #'as yet unclassified' }
ComponentePosteo >> renderButtonLike: aCanvas pregunta: unaPregunta [
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
