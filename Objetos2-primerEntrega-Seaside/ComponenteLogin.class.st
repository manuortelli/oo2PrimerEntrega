Class {
	#name : #ComponenteLogin,
	#superclass : #ComponenteDeAcceso,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'private protocol' }
ComponenteLogin >> login [
"Chequea el usuario y contraseña y procede"
	| usuarioLogueado ok |
	usuarioLogueado := self model
		usuario: self usuario
		protegidoPor: self password.
	usuarioLogueado
		ifNotNil: [ :user | 
			self procedeCon: user quoora: self model.
			ok := true ];
		ifNil: [ ok := false ].
	usuario := nil.
	password := nil.
	^ ok
]

{ #category : #'private protocol' }
ComponenteLogin >> registrarNuevoUsuario [
	self call: ComponenteRegistro new
]

{ #category : #'private protocol' }
ComponenteLogin >> renderButtonsOn: aCanvas [
	self renderSignInButtonOn: aCanvas.
	aCanvas horizontalRule.
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
ComponenteLogin >> renderSignInButtonOn: aCanvas [
	aCanvas formButton
		bePrimary;
		beLarge;
		callback: [ self login];
		with: '   Entrar   '
]

{ #category : #rendering }
ComponenteLogin >> renderSignUpButtonOn: aCanvas [
"Muestra el boton de registrar y llama al metodo que registra"
	aCanvas heading level4
		with: [ aCanvas space.
			aCanvas small textMuted with: '¿Desea Registrarse?' ].
	aCanvas outlineButton
		bePrimary;
		callback: [ self registrarNuevoUsuario ];
		with: 'Registrarse'
]
