Class {
	#name : #ComponenteNuevoTopico,
	#superclass : #SBSComponent,
	#instVars : [
		'topico',
		'descripcion',
		'topicoConComa'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
ComponenteNuevoTopico >> cargar [
"Si ingreso un topico llama al metodo que agrega el topico y la descripcion"
	self topico isEmpty
		ifTrue: [ ^ self ].
	self session usuario
		agregarTopicoDeinteres: topico
		unaDescripcion: descripcion.
	self answer
]

{ #category : #accessing }
ComponenteNuevoTopico >> descripcion [ 	
	^descripcion
]

{ #category : #accessing }
ComponenteNuevoTopico >> descripcion: unaDescripcion [ 
	descripcion := unaDescripcion
]

{ #category : #accessing }
ComponenteNuevoTopico >> renderButtonOn: aCanvas [
"Muestra los botones que realizan la accion de cargar topico y cancelar"
	aCanvas submitButton
		class: 'btn btn-primary';
		callback: [ self cargar ];
		with: 'Cargar topico'.
	aCanvas submitButton
		class: 'btn btn-danger';
		callback: [ self answer ];
		with: 'Cancelar'
]

{ #category : #rendering }
ComponenteNuevoTopico >> renderContentOn: aCanvas [
	aCanvas form: [ self renderInputOn: aCanvas.
		self renderButtonOn: aCanvas]
]

{ #category : #rendering }
ComponenteNuevoTopico >> renderInputOn: aCanvas [
"Muestra el formulario para el nuevo componente"
	aCanvas heading level3 with: 'Titulo del topico'.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas heading level3 with: 'Descripcion'.
	aCanvas paragraph: [ aCanvas textInput on: #descripcion of: self ]
]

{ #category : #accessing }
ComponenteNuevoTopico >> topico [ 	
	^topico
]

{ #category : #accessing }
ComponenteNuevoTopico >> topico: unTopico [ 
	topico := unTopico 
]
