Class {
	#name : #ComponenteFormularioRespuesta,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'preguntaaResponder',
		'texto'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponenteFormularioRespuesta class >> of: unaPregunta [
	| instancia |
	instancia := self new.
	instancia inicializarCon: unaPregunta.
	^ instancia
]

{ #category : #rendering }
ComponenteFormularioRespuesta >> inicializarCon: unaPregunta [ 
	preguntaaResponder := unaPregunta
]

{ #category : #accessing }
ComponenteFormularioRespuesta >> pregunta [
	^ preguntaaResponder 
]

{ #category : #rendering }
ComponenteFormularioRespuesta >> renderContentOn: aCanvas [

	self renderFormulario: aCanvas
]

{ #category : #rendering }
ComponenteFormularioRespuesta >> renderFormulario: aCanvas [
	aCanvas
		form: [ (aCanvas textArea on: #texto of: self)
				columns: 40;
				rows: 5.
			aCanvas break.
			aCanvas submitButton
				callback: [ self responder ];
				with: 'Guardar'.
			aCanvas submitButton
				callback: [ self answer ];
				value: 'Cancelar' ]
]

{ #category : #accessing }
ComponenteFormularioRespuesta >> responder [
	texto ifEmpty: [ ^ self ].
	self pregunta
		agregarRespuestaConTexto: self texto
		usuario: self session usuario
]

{ #category : #accessing }
ComponenteFormularioRespuesta >> texto [ 	
	^texto
]

{ #category : #accessing }
ComponenteFormularioRespuesta >> texto: unTexto [
	texto:= unTexto 
]
