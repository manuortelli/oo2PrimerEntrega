Class {
	#name : #ComponenteNuevaPregunta,
	#superclass : #ComponentePrincipal,
	#instVars : [
		'descripcion',
		'titulo',
		'topico',
		'quoora'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'instance creation' }
ComponenteNuevaPregunta class >> of: unQuoora [
	| instancia |
	instancia := self new.instancia inicializarCon: unQuoora.
	^ instancia
]

{ #category : #accessing }
ComponenteNuevaPregunta >> descripcion [ 	^descripcion
]

{ #category : #accessing }
ComponenteNuevaPregunta >> descripcion: unaDescripcion [
	descripcion := unaDescripcion 
	
]

{ #category : #'as yet unclassified' }
ComponenteNuevaPregunta >> inicializarCon: unQuoora [
	quoora := unQuoora 
]

{ #category : #accessing }
ComponenteNuevaPregunta >> post [
	(self titulo isEmpty or: self topico isEmpty ) ifTrue: [ ^ self  ].
	self quoora
		agregarPreguntaConTopico: (self topico splitOn: ',')
		titulo: self titulo
		descripcion: self descripcion
		usuario: self session usuario.
	self answer
]

{ #category : #'as yet unclassified' }
ComponenteNuevaPregunta >> quoora [
	^quoora
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
		with: 'Cancelar'.
	aCanvas horizontalRule.
	aCanvas space.
	aCanvas space.
	self renderLogoutButtonOn: aCanvas
]

{ #category : #rendering }
ComponenteNuevaPregunta >> renderContentOn: aCanvas [
	aCanvas 
		form: [ self renderInputElementon: aCanvas.
			self renderButtonOn: aCanvas ]
]

{ #category : #accessing }
ComponenteNuevaPregunta >> renderInputElementon: aCanvas [
	aCanvas heading	 level5 with: 'Titulo'.
	aCanvas paragraph: [ aCanvas textInput on: #titulo of: self ].
	aCanvas heading level5	with: 'Topico '.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas heading level5 with: 'Descripcion '.
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
