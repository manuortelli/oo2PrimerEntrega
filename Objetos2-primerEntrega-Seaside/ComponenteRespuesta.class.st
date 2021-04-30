Class {
	#name : #ComponenteRespuesta,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'respuesta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponenteRespuesta class >> of: unaRespuesta [
	| instancia |
	instancia := self new.
	instancia inicialializarCon: unaRespuesta.
	^ instancia
]

{ #category : #rendering }
ComponenteRespuesta >> inicialializarCon: unaRespuesta [
	respuesta := unaRespuesta 
	
]

{ #category : #rendering }
ComponenteRespuesta >> mostrarLikeOn: aCanvas [
	aCanvas heading level4
		with:
			'like: ' , self respuesta cantidadLikes greaseString , '   Dislike:  '
				, respuesta cantidadDislikes greaseString.
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self respuesta agregarLike: self session usuario ];
				with: 'Like'.
			aCanvas space.
			aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self respuesta agregarDislike: self session usuario ];
				with: 'Dislike' ]
]

{ #category : #'as yet unclassified' }
ComponenteRespuesta >> mostrarseOn: aCanvas [
	aCanvas
		text: 'Respuesta de ' , self respuesta usuarioPropietario nombre.
	aCanvas heading level5 with: self respuesta texto.
	self mostrarLikeOn: aCanvas
]

{ #category : #rendering }
ComponenteRespuesta >> renderContentOn: aCanvas [
	self mostrarseOn: aCanvas.
	
]

{ #category : #rendering }
ComponenteRespuesta >> respuesta [
 ^respuesta 
]
