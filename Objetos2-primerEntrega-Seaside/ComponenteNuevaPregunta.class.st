Class {
	#name : #ComponenteNuevaPregunta,
	#superclass : #SBSComponent,
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

{ #category : #accessing }
ComponenteNuevaPregunta >> renderButtonOn: aCanvas [
	aCanvas submitButton
		class: 'btn btn-outline-primary';
		callback: [ self post ];
		with: 'Agregar pregunta'.
	aCanvas space.
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-outline-secondary';
		callback: [ self answer ];
		with: 'Volver'.
	aCanvas space.
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-danger';
		callback: [ self call: ComponenteLogin new ];
		with: 'Salir'
]

{ #category : #rendering }
ComponenteNuevaPregunta >> renderContentOn: aCanvas [
	aCanvas 
		form: [ self renderInputElementon: aCanvas.
			self renderButtonOn: aCanvas ]
]

{ #category : #accessing }
ComponenteNuevaPregunta >> renderInputElementon: aCanvas [
	aCanvas heading
		level: 5;
		with: 'Titulo'.
	aCanvas  paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas heading
		level: 5;
		with: 'Topico ' greaseString.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas heading
		level: 5;
		with: 'Descripcion ' greaseString.
	aCanvas paragraph: [ aCanvas textArea on: #descripcion of: self ]
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
