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
	elUsuario := UsuarioQuoora initializeConNombre: name 	password: password.
		self model
		agregarUsuario: elUsuario.
	self proceedWith: elUsuario
]

{ #category : #accessing }
ComponenteRegistro >> renderButtonsOn: aCanvas [
	self renderSignUpButtonOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Nombre'.
	aCanvas paragraph: [ aCanvas textInput on: #name of: self ].
	super renderInputElementsOn: aCanvas
]

{ #category : #accessing }
ComponenteRegistro >> renderSignUpButtonOn: aCanvas [
	aCanvas submitButton
		callback: [ self registrarseYLoguearse  ];
		with: 'Registrarse'
]
