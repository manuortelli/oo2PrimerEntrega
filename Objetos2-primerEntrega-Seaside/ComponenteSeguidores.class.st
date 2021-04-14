Class {
	#name : #ComponenteSeguidores,
	#superclass : #SBSComponent,
	#instVars : [
		'seguidor'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> mostrarSeguidores: aCanvas [
	aCanvas heading
		level: 2;
		with: 'Seguidores'.
	self session usuario getFollowers isEmpty
		ifTrue: [ aCanvas alert beSecondary with: 'No hay usuarios seguidos'.
				aCanvas break ];
		ifFalse: [ aCanvas
					unorderedList: [ self session usuario getFollowers
							do: [ :each | each do: [ :i | aCanvas listItem: i name ] ] ] ].
]

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> renderButtonOn: aCanvas [
	aCanvas submitButton
		class: 'btn btn-primary';
		callback: [ self seguir ];
		with: 'Seguir'.
	aCanvas space.
	aCanvas submitButton
		class: 'btn btn-outline-secondary';
		callback: [ self answer ];
		with: 'Volver'.
	aCanvas space.
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-danger';
				callback: [ self call: ComponenteLogin new ];
				with: 'Salir' ]
]

{ #category : #rendering }
ComponenteSeguidores >> renderContentOn: aCanvas [
	self mostrarSeguidores: aCanvas.
	aCanvas
		form: [ self renderInputOn: aCanvas.
				self renderButtonOn: aCanvas].
			
]

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> renderInputOn:  aCanvas [
	aCanvas heading
				level: 4;
				with: 'Ingrese la persona que desea seguir'.
			aCanvas paragraph: [ aCanvas textInput on: #seguidor of: self ].
]

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> seguidor [
	^ seguidor
]

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> seguidor: unSeguidor [
	seguidor := unSeguidor
]

{ #category : #'as yet unclassified' }
ComponenteSeguidores >> seguir [
	self session quoora
		agregarFollowerName: self seguidor
		usuario: self session usuario.
		 self
		call: ComponentePrincipal new
]
