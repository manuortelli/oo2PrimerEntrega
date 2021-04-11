Class {
	#name : #ComponenteNuevaPregunta,
	#superclass : #WAComponent,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteNuevaPregunta >> post [
	pregunta ifEmpty: [ ^ self ].
	self session quora
		agregarPreguntaConTopico: 'topico1'
		titulo: 'titulo1'
		descripcion: 'descripcion1'
		usuario: self session user.
	self answer
]

{ #category : #accessing }
ComponenteNuevaPregunta >> pregunta [
	^ pregunta
]

{ #category : #accessing }
ComponenteNuevaPregunta >> pregunta: unaPregunta [

	 pregunta:= unaPregunta
]

{ #category : #rendering }
ComponenteNuevaPregunta >> renderContentOn: aCanvas [
	aCanvas
		form: [ (aCanvas textArea on: #pregunta of: self)
				columns: 80;
				rows: 5.
			aCanvas break.
			aCanvas submitButton
				callback: [ self post ];
				with: 'Post' ]
]
