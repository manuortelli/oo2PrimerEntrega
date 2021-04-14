Class {
	#name : #ComponenteLogin,
	#superclass : #ComponenteDeAcceso,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'private protocol' }
ComponenteLogin >> login [
	| usuarioss |
	usuarioss := self model
		usuario: self usuario
		protegidoPor: self password.
	usuarioss ifNotNil: [ :it | self proceedWith: it quoora: self model ].
	usuario := nil.
	password := nil
]

{ #category : #'private protocol' }
ComponenteLogin >> registrarNuevoUsuario [
	self call: ComponenteRegistro new.
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
		callback: [ self login ];
		with: '   Entrar   '
]

{ #category : #rendering }
ComponenteLogin >> renderSignUpButtonOn: aCanvas [
	aCanvas heading
		level:4;
		with: [ aCanvas space.
			aCanvas small textMuted with: '¿Desea Registrarse?' ].
	aCanvas outlineButton
		bePrimary;
		callback: [ self registrarNuevoUsuario ];
		with: 'Registrarse'
]
