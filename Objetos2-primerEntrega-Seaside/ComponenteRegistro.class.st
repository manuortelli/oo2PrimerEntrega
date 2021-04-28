Class {
	#name : #ComponenteRegistro,
	#superclass : #ComponenteDeAcceso,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteRegistro >> registrarseYLoguearse [
	| elUsuario |
	(usuario isEmpty or:  password  isEmpty) ifTrue:   [ ^ 'self' ].
	elUsuario := self model
		crearUsuarioNombre: usuario
		password: password.
	self procedeCon: elUsuario quoora: self model
]

{ #category : #accessing }
ComponenteRegistro >> renderButtonsOn: aCanvas [

	aCanvas outlineButton
		bePrimary;
		callback: [ self registrarseYLoguearse ];
		with: 'Registrarse'.
	aCanvas space
]

{ #category : #accessing }
ComponenteRegistro >> renderInputElementsOn: aCanvas [
	super renderInputElementsOn: aCanvas
]
