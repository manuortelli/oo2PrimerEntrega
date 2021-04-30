Class {
	#name : #ComponentePerfil,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePerfil class >> of: unUsuario [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unUsuario.
	instancia inspect.
	^ instancia
]

{ #category : #'as yet unclassified' }
ComponentePerfil >> inicializarCon: unUsuario [ 
	usuario := unUsuario
]

{ #category : #rendering }
ComponentePerfil >> mostrar: aCanvas preguntas: unasPreguntas [
	aCanvas unorderedList
		with: [ unasPreguntas
				do: [ :pregunta | 
					aCanvas
						listItem: [ aCanvas render: (ComponentePost of: pregunta) ].
					aCanvas horizontalRule ] ]
]

{ #category : #'as yet unclassified' }
ComponentePerfil >> renderContentOn: aCanvas [
	self renderSeguidoresOn: aCanvas.
	self renderPostsOn: aCanvas.
	self renderLogoutButtonOn: aCanvas.
]

{ #category : #rendering }
ComponentePerfil >> renderPostsOn: aCanvas [
	| quoora preguntas |
	quoora := Quoora soleInstance.
	preguntas := quoora preguntasDeUnUsuario:  self usuario.
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas 
]

{ #category : #rendering }
ComponentePerfil >> renderSeguidoresOn: aCanvas [
	aCanvas text:
		 ('Bienvenido al perfil de: ' , self usuario nombre, '  ').
	aCanvas anchor
		callback: [  self seguir.  ];
		with: 'Seguir'.
	

]

{ #category : #'as yet unclassified' }
ComponentePerfil >> seguir [ 
	self session usuario agregarFollower: self usuario
]

{ #category : #accessing }
ComponentePerfil >> usuario [
	^usuario
]
