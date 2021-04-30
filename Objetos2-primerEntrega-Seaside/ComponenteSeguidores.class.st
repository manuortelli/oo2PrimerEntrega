Class {
	#name : #ComponenteSeguidores,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'seguidor'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> mostrarSeguidores: aCanvas [
	aCanvas heading level2 with: 'Seguidores'.
	self session usuario followers
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay usuarios seguidos'.
			aCanvas break ].
	aCanvas
		unorderedList: [ self session usuario followers
				do: [ :follower | aCanvas listItem: (follower nombre ) ] ]
]

{ #category : #rendering }
ComponenteSeguidores >> renderButtonOn: aCanvas [ 
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-outline-secondary';
		callback: [ self answer ];
		with: 'Volver'.
	aCanvas space.
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-danger';
				callback: [ self call: ComponenteLogin new ];
				with: 'Salir' ] 
]

{ #category : #rendering }
ComponenteSeguidores >> renderContentOn: aCanvas [
	self mostrarSeguidores: aCanvas.
	self renderVolverOn: aCanvas.
			aCanvas space.
	self renderLogoutButtonOn: aCanvas. 
]
