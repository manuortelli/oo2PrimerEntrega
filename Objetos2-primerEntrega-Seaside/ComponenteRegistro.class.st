Class {
	#name : #ComponenteRegistro,
	#superclass : #ComponenteDeAcceso,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteRegistro >> registrarseYLoguearse [
	| elUsuario |
	elUsuario := self model
		crearUsuarioNombre: usuario
		password: password.
	self proceedWith: elUsuario quoora: self model
]

{ #category : #accessing }
ComponenteRegistro >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderInputElementsOn: aCanvas [
	super renderInputElementsOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderSignUpButtonOn: aCanvas [
	aCanvas outlineButton
		bePrimary;
		callback: [ self registrarseYLoguearse ];
		with: 'Registrarse'.
	aCanvas space
]
