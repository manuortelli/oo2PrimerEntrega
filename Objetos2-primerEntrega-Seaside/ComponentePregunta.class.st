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
	| instancia |
	instancia := self new.
	^ instancia initializeCon: unaPregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> agregarLike: unaPregunta estado: unBoolean [
	self session quoora
		agregarLikePregunta: unaPregunta
		usuario: self session usuario
		estado: unBoolean
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> initializeCon: unaPregunta [
	pregunta := unaPregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderButtonLike: aCanvas pregunta: unaPregunta [
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self agregarLike: unaPregunta estado: true ];
				with: 'Like'.
			aCanvas space.
			aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self agregarLike: unaPregunta estado: false ];
				with: 'Dislike' ]
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderContentOn: aCanvas [
	aCanvas anchor
		callback: [ self renderButtonLike: aCanvas pregunta: pregunta ];
		with: pregunta titulo. aCanvas heading level4
		with: 'Topico: ' , pregunta getTopicoNombre.
	aCanvas heading level4
		with: 'Creado por: ' , pregunta usuarioPropietario name.
	aCanvas heading level4
		with:
			'like: ' , pregunta getLikes greaseString , ' Dislike:  '
				, pregunta getDislikes greaseString.
	self renderRespuesta: aCanvas pregunta: pregunta.
	self renderRespuesta: aCanvas pregunta: pregunta
]

{ #category : #'as yet unclassified' }
ComponentePregunta >> renderRespuesta: aCanvas pregunta: unaPregunta [
	aCanvas unorderedList
		with: [ unaPregunta getRespuestas
				do: [ :respuesta | 
					aCanvas
						listItem: [ aCanvas heading level3 with: 'Respuesta:  '.
							respuesta getRespuestas.
							self renderButtonLike: aCanvas pregunta: respuesta. ] ] ].
			
]
