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
	self session quoora
		agregarTopicoNombre: self topico 
		descripcion: self descripcion
		usuario: self session usuario.
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
	aCanvas heading level3 with: 'Titulo del topico' greaseString.
	aCanvas paragraph: [ aCanvas textInput on: #topico of: self ].
	aCanvas heading level3 with: 'Descripcion' greaseString.
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

{ #category : #accessing }
ComponenteNuevoTopico >> topicoConComa [
	^ topicoConComa 
]

{ #category : #accessing }
ComponenteNuevoTopico >> topicoConComa: unTopico [
	topicoConComa := unTopico 
]
