Class {
	#name : #ComponenteRegistro,
	#superclass : #ComponenteDeAcceso,
	#instVars : [
		'name'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteRegistro >> name [
	^name
]

{ #category : #accessing }
ComponenteRegistro >> name: unNombre [ 
	name:= unNombre
]

{ #category : #accessing }
ComponenteRegistro >> registrarseYLoguearse [
	| elUsuario |
	elUsuario := self model crearUsuarioNombre:  name password: password.
	self proceedWith: elUsuario quoora: self model
]

{ #category : #accessing }
ComponenteRegistro >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Nombre'.
	aCanvas paragraph: [ aCanvas textInput on: #usuario of: self ].
	super renderInputElementsOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarseYLoguearse  ];
		with: 'Registrarse'
]
