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
ComponenteSeguidores >> renderContentOn: aCanvas [
	self mostrarSeguidores: aCanvas.
	aCanvas space.
	self renderLogoutButtonOn: aCanvas
]
