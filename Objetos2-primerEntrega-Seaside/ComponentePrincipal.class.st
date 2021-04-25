"
""(WAAdmin register: ComponenteLogin  asApplicationAt: 'cuoora')
	sessionClass: SesionConUsuario ;
	addLibrary: JQDeploymentLibrary;
	addLibrary: SBSDevelopmentLibrary""
"
Class {
	#name : #ComponentePrincipal,
	#superclass : #SBSComponent,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #rendering }
ComponentePrincipal >> agregar [
	self call:  ComponenteSeguidores new
]

{ #category : #rendering }
ComponentePrincipal >> agregarFollower: aCanvas [
	aCanvas
		form: [ aCanvas submitButton
				class: 'tn btn-success';
				callback: [ self call: ComponenteSeguidores new ];
				with: '  Ver seguidores  ' ]
]

{ #category : #rendering }
ComponentePrincipal >> mostrar: aCanvas preguntas: unasPreguntas [
	aCanvas unorderedList
		with: [ unasPreguntas
				do: [ :pregunta | 
					aCanvas
						listItem: [ aCanvas render: (ComponentePregunta of: pregunta) ].
					aCanvas horizontalRule ] ]
]

{ #category : #rendering }
ComponentePrincipal >> renderButtonOn: aCanvas [

aCanvas
		form: [ aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: ComponenteNuevaPregunta new ];
				with: '  Nueva pregunta  '.
			aCanvas space.
			aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: ComponenteNuevoTopico new ];
				with: '  Agregar topico de Interes ' ]
]

{ #category : #rendering }
ComponentePrincipal >> renderContentOn: aCanvas [
	aCanvas heading level3
		with: 'Bienvenido ' , self session usuario nombre greaseString.
	self renderPostsOn: aCanvas.
	aCanvas space.
	self agregarFollower: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
ComponentePrincipal >> renderLogoutButtonOn: aCanvas [
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-danger btn-lg';
				callback: [ self call: ComponenteLogin new ];
				with: 'Salir' ]
]

{ #category : #rendering }
ComponentePrincipal >> renderPostsOn: aCanvas [
	| preguntas |
	preguntas := self session quoora
		preguntasRelevantesDeUnUsuario: self session usuario.
	preguntas
		ifEmpty: [ aCanvas alert beSecondary with: 'No hay preguntas de interes'.
			aCanvas break ].
	aCanvas heading level2 with: 'Preguntas'.
	self mostrar: aCanvas preguntas: preguntas.
	self renderButtonOn: aCanvas
]
