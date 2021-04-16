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
ComponentePrincipal >> agregarLike: unaPregunta estado: unBoolean [
	self session quoora
		agregarLikePregunta: unaPregunta
		usuario: self session usuario
		estado: unBoolean
]

{ #category : #rendering }
ComponentePrincipal >> renderButtonLike: aCanvas pregunta: unaPregunta [
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self agregarLike: unaPregunta estado: true ];
				with: 'Like'.
			aCanvas space.
			aCanvas submitButton
				class: 'btn btn-outline-primary';
				callback: [ self agregarLike: unaPregunta estado: false ];
				with: 'Dislike' ].
]

{ #category : #rendering }
ComponentePrincipal >> renderContentOn: aCanvas [
	aCanvas heading
		level: 3;
		with: [ 'Bienvenido ' , self session usuario name greaseString ].
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
		getPreguntasDeUnUsuario: self session usuario.
	aCanvas heading
		level: 2;
		with: 'Preguntas' greaseString.
	aCanvas unorderedList
		with: [ preguntas
				do: [ :each | 
					aCanvas listItem
						with: [ aCanvas heading: each titulo.
							aCanvas heading
								level: 5;
								with: 'Topico: ' , each getTopico greaseString.
							aCanvas heading
								level: 5;
								with: 'like: ' , each getLikes greaseString.
							self renderButtonLike: aCanvas pregunta: each ] ] ].
	aCanvas
		form: [ aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: ComponenteNuevaPregunta new ];
				with: '  Nueva pregunta  '.
			aCanvas space.
			aCanvas submitButton
				class: 'tn btn-outline-success';
				callback: [ self call: ComponenteNuevoTopico new ];
				with: '  Agregar topico ' ]
]
