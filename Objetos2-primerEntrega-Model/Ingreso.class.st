Class {
	#name : #Ingreso,
	#superclass : #Object,
	#instVars : [
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-primerEntrega-Model'
}

{ #category : #accessing }
Ingreso class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #accessing }
Ingreso class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #'as yet unclassified' }
Ingreso >> UsuarioQueMacheCon: aString [
	^ usuarios
		select:
			[ :each | each name asLowercase includesSubstring: aString asLowercase ]
]

{ #category : #'as yet unclassified' }
Ingreso >> agregarUsuario: unUsuario [
	
]

{ #category : #'as yet unclassified' }
Ingreso >> initialize [
	usuarios := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Ingreso >> usuario: unUsuario protegidoPor: unaPassword [
	^ usuarios
		detect: [ :each | each email = unUsuario  & (each password == unaPassword) ]
		ifNone: [ nil ]
]

{ #category : #'as yet unclassified' }
Ingreso >> usuarios [
	^usuarios
]
