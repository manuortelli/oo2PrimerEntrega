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

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> inicializarCon: unaPregunta [
	pregunta:= unaPregunta 
]

{ #category : #accessing }
ComponentePreguntaDetalle >> pregunta [
	^pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderButtonLike: aCanvas pregunta: unaPregunta [
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

{ #category : #rendering }
ComponentePreguntaDetalle >> renderContentOn: aCanvas [
	self renderDetalle: aCanvas 
]

{ #category : #'as yet unclassified' }
ComponentePreguntaDetalle >> renderDetalle: aCanvas [
"	aCanvas heading level3 with: self pregunta titulo.
	aCanvas heading level4 with: 'Topico: ' , self pregunta topicoNombre."
	aCanvas heading level4
		with: 'Creado por: ' , pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, self pregunta cantidadLikes greaseString.
	self renderButtonLike: aCanvas pregunta: pregunta.
	self renderRespuesta: aCanvas pregunta: pregunta
]

{ #category : #rendering }
ComponentePreguntaDetalle >> renderLikeOn: aCanvas [
aCanvas anchor
		class: 'display-5';
		callback:
				[ aCanvas render: (ComponentePerfil of: pregunta usuarioPropietario) ];
		with: 'Creado por: ' , self pregunta usuarioPropietario nombre.
	aCanvas heading level4
		with:
			'like: ' , self pregunta cantidadDislikes greaseString , ' Dislike:  '
				, self pregunta cantidadLikes greaseString
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
