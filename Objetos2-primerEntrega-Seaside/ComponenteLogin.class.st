Class {
	#name : #ComponenteLogin,
	#superclass : #ComponenteDeAcceso,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'private protocol' }
ComponenteLogin >> login [
	| usuarioss ok |
	usuarioss := self model
		usuario: self usuario
		protegidoPor: self password.
	usuarioss
		ifNotNil: [ :it | 
			self proceedWith: it quoora: self model.
			ok := true ];
		ifNil: [ ok := false ].
	usuario := nil.
	password := nil.
	^ ok
]

{ #category : #'private protocol' }
ComponenteLogin >> login: aCanvas [
	| usuarioss |
	usuarioss := self model
		usuario: self usuario
		protegidoPor: self password.
	usuarioss
		ifNil: [aCanvas alert beSecondary with: 'No hay usuarios seguidos' ];
		ifNotNil: [ :it | self proceedWith: it quoora: self model ].
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
		callback: [ self login];
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
