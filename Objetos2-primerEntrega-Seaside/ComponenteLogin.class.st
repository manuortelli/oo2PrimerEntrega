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
	aCanvas paragraph: '¿Quieres registrarte?'.
	self renderSignUpButtonOn: aCanvas
]

{ #category : #rendering }
ComponenteLogin >> renderSignInButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self login ];
		with: 'Ingresar'
]

{ #category : #rendering }
ComponenteLogin >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarNuevoUsuario  ];
		with: 'Registrarse'
]
