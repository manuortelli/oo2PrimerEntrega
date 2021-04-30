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
ComponentePerfil >> rendenContentOn: aCanvas [

	aCanvas heading level3
		with: 'Bienvenido al perfil de:' , self usuario.
	self renderPostsOn: aCanvas
]

{ #category : #'as yet unclassified' }
ComponentePerfil >> renderContentOn: aCanvas [
	aCanvas heading level3
		with: 'Bienvenido al perfil de: ' , self usuario nombre.
	self renderPostsOn: aCanvas.
	self renderLogoutButtonOn: aCanvas.
	self renderVolverOn: aCanvas
]

{ #category : #rendering }
ComponentePerfil >> renderPostsOn: aCanvas [
	| quoora preguntas |
	quoora := Quoora soleInstance.
	preguntas := quoora preguntasRelevantesDeUnUsuario: self usuario.
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas 
]

{ #category : #accessing }
ComponentePerfil >> usuario [
	^usuario
]
