Class {
	#name : #ComponenteDeAcceso,
	#superclass : #WAComponent,
	#instVars : [
		'usuario',
		'password'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteDeAcceso >> model [
	^ Quoora soleInstance
]

{ #category : #accessing }
ComponenteDeAcceso >> password [ 
	^ password 
]

{ #category : #accessing }
ComponenteDeAcceso >> password: aPassword [ 
	password:= aPassword 
]

{ #category : #accessing }
ComponenteDeAcceso >> proceedWith: aUser quoora: unQuoora [
	self session quoora: unQuoora.
	self session usuario: aUser.
	self call: ComponentePrincipal new
]

{ #category : #accessing }
ComponenteDeAcceso >> renderButtonsOn: aCanvas [
	self subclassResponsibility
]

{ #category : #accessing }
ComponenteDeAcceso >> renderContentOn: aCanvas [
	aCanvas
		form: [ self renderInputElementsOn: aCanvas.
			self renderButtonsOn: aCanvas ]
]

{ #category : #accessing }
ComponenteDeAcceso >> renderInputElementsOn: aCanvas [
	aCanvas label: 'Usuario'.
	aCanvas paragraph: [ aCanvas textInput on: #usuario of: self ].
	aCanvas label: 'Contraseña'.
	aCanvas paragraph: [ aCanvas passwordInput on: #password of: self ]
]

{ #category : #accessing }
ComponenteDeAcceso >> usuario [
	^usuario
]

{ #category : #accessing }
ComponenteDeAcceso >> usuario: unUsuario [
	usuario:= unUsuario 
]
