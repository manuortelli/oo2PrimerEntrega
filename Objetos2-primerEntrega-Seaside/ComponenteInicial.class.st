Class {
	#name : #ComponenteInicial,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'quoora'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponenteInicial class >> of: unQuoora [ 	
	| instancia |
	instancia:= self new.
	instancia inicializarCon: unQuoora.
	^ instancia
]

{ #category : #rendering }
ComponenteInicial >> agregar [
	self call:  ComponenteSeguidores new
]

{ #category : #rendering }
ComponenteInicial >> agregarFollower: aCanvas [
	aCanvas
		form: [ aCanvas submitButton
				class: 'tn btn-success';
				callback: [ self call: ComponenteSeguidores new ];
				with: '  Ver seguidos  ' ]
]

{ #category : #'as yet unclassified' }
ComponenteInicial >> inicializarCon: unQuoora [.
	quoora := unQuoora 
]

{ #category : #rendering }
ComponenteInicial >> mostrar: aCanvas preguntas: unasPreguntas [
	aCanvas unorderedList
		with: [ unasPreguntas
				do: [ :pregunta | 
					aCanvas
						listItem: [ aCanvas render: (ComponentePost of: pregunta and: self).
							aCanvas horizontalRule ].
					aCanvas horizontalRule ] ]
]

{ #category : #'as yet unclassified' }
ComponenteInicial >> quoora [
	^quoora
]

{ #category : #rendering }
ComponenteInicial >> renderButtonOn: aCanvas [
	aCanvas
		form: [ aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: (ComponenteNuevaPregunta of: self quoora)];
				with: '  Nueva pregunta  '.
			aCanvas space.
			aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: ComponenteNuevoTopico new ];
				with: '  Agregar topico de Interes ' ]
]

{ #category : #rendering }
ComponenteInicial >> renderContentOn: aCanvas [
	aCanvas heading level3
		with: 'Bienvenido ' , self session usuario nombre greaseString.
	self renderPostsOn: aCanvas.
	aCanvas space.
	self agregarFollower: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas.
]

{ #category : #rendering }
ComponenteInicial >> renderPostsOn: aCanvas [
	| preguntas |
	self quoora inspect.
	preguntas := self quoora
		preguntasRelevantesDeUnUsuario: self session usuario.
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas.
	self renderButtonOn: aCanvas
]
