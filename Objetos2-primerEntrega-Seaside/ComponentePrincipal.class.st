Class {
	#name : #ComponentePrincipal,
	#superclass : #SBSComponent,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponentePrincipal >> cerrar [
	"No me anda lo comentado, por eso lo hago de esta manera"

	self call: ComponenteLogin new

"self session unregister.
  self requestContext redirectTo: (self call: ComponenteLogin new)"
]

{ #category : #rendering }
ComponentePrincipal >> renderLogoutButtonOn: aCanvas [
	aCanvas
		form: [ aCanvas submitButton
				class: 'btn btn-danger btn-lg';
				callback: [ self cerrar];
				with: 'Salir' ]
]
