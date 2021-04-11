Class {
	#name : #ComponentePrincipal,
	#superclass : #WAComponent,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponentePrincipal >> crearNuevaPregunta [
	self call: ComponenteNuevaPregunta new.
]

{ #category : #rendering }
ComponentePrincipal >> renderContentOn: aCanvas [
	aCanvas heading: [ 'Bienvenido ' , self session usuario name ].
	self renderPostsOn: aCanvas.
	aCanvas horizontalRule.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
ComponentePrincipal >> renderLogoutButtonOn: aCanvas [
	aCanvas
		paragraph: [ aCanvas anchor
				callback: [ self answer ];
				with: [ aCanvas button with: 'Salir' ] ]
]

{ #category : #rendering }
ComponentePrincipal >> renderPostsOn: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Preguntas'.
	aCanvas
		unorderedList: [ (self session quoora getPreguntasDeUnUsuario: self session usuario)
				do: [ :each | aCanvas listItem: each titulo ]].
	aCanvas anchor
		callback: [ self crearNuevaPregunta ];
		with: [ aCanvas button: 'New post' ]
]
