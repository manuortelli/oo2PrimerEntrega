Class {
	#name : #ComponentePerfil,
	#superclass : #ComponentePost,
	#instVars : [
		'preguntas'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponentePerfil >> inicialize [
	preguntas := (Quoora soleInstance ) preguntasRelevantesDeUnUsuario: (self pregunta usuarioPropietario )
	
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

{ #category : #accessing }
ComponentePerfil >> preguntas [
	^ preguntas
]

{ #category : #'as yet unclassified' }
ComponentePerfil >> rendenContentOn: aCanvas [
	aCanvas heading level3
		with: 'Bienvenido al perfil de:' , (preguntas
		at: 1 usuarioPropietario).
	self renderPostsOn: aCanvas
]

{ #category : #rendering }
ComponentePerfil >> renderPostsOn: aCanvas [
self
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas
]
