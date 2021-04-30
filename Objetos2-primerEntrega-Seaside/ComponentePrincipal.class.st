Class {
	#name : #ComponentePrincipal,
	#superclass : #SBSComponent,
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #'as yet unclassified' }
ComponentePrincipal >> cerrar [
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

{ #category : #'as yet unclassified' }
ComponentePrincipal >> renderNavbar: aCanvas [
	|nav|
	nav := [ aCanvas navigationLink url: (aCanvas render: (self call: ComponenteLogin new)); with: 'Volver'.
		aCanvas navigationLink url: (self renderLogoutButtonOn: aCanvas); with: 'Salir'].
	aCanvas navigation justifyContentEnd; with: nav

]

{ #category : #'as yet unclassified' }
ComponentePrincipal >> renderVolverOn: aCanvas [
aCanvas submitButton
		class: 'btn btn-outline-secondary';
		callback: [ self answer ];
		with: 'Volver'.
]
