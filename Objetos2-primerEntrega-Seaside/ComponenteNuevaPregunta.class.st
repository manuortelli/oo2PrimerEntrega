Class {
	#name : #ComponenteNuevaPregunta,
	#superclass : #WAComponent,
	#instVars : [
		'descripcion',
		'titulo',
		'topico'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteNuevaPregunta >> descripcion [ 	^descripcion
]

{ #category : #accessing }
ComponenteNuevaPregunta >> descripcion: unaDescripcion [
	descripcion := unaDescripcion 
	
]

{ #category : #accessing }
ComponenteNuevaPregunta >> post [
	"topico ifEmpty: [ ^ self ]."

	self session quoora
		agregarPreguntaConTopico: (self topico)
		titulo: (self titulo)
		descripcion: self descripcion
		usuario: self session usuario.
	self answer
]

{ #category : #rendering }
ComponenteNuevaPregunta >> renderContentOn: aCanvas [
	aCanvas
		form: [ aCanvas
				paragraph: [ aCanvas label: 'pregunta:  '.
					aCanvas textInput on: #titulo of: self ].
			aCanvas
				paragraph: [ aCanvas label: 'topico:  '.
					aCanvas textInput on: #topico of: self ].
			aCanvas paragraph: 'Desripcion'.
			(aCanvas textArea on: #descripcion of: self)
				columns: 60;
				rows: 3.
			aCanvas break.
			aCanvas submitButton
				callback: [ self post ];
				with: 'Preguntar' ]
]

{ #category : #accessing }
ComponenteNuevaPregunta >> titulo [ 
	^ titulo
]

{ #category : #accessing }
ComponenteNuevaPregunta >> titulo: unTitulo [
	titulo := unTitulo 
]

{ #category : #accessing }
ComponenteNuevaPregunta >> topico [
	^ topico
]

{ #category : #accessing }
ComponenteNuevaPregunta >> topico: unTopico [
	topico := unTopico
]
