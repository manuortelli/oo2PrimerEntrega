Class {
	#name : #ComponentePerfil,
	#superclass : #SBSComponent,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponentePerfil class >> of: unUsuario [
	| perfil |
	perfil := self new.
	perfil inicializarCon: unUsuario.
	^perfil
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
						listItem: [ aCanvas render: (ComponentePregunta of: pregunta) ].
					aCanvas horizontalRule ] ]
]

{ #category : #'as yet unclassified' }
ComponentePerfil >> rendenContentOn: aCanvas [
	aCanvas heading level3 with: 'Bienvenido al perfil de:', usuario  greaseString .
	self renderPostsOn: aCanvas
]

{ #category : #rendering }
ComponentePerfil >> renderPostsOn: aCanvas [
	| preguntas |
	preguntas := self session quoora
		preguntasRelevantesDeUnUsuario: usuario.
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas
]
