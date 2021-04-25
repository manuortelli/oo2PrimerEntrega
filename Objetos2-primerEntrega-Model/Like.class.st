Class {
	#name : #Like,
	#superclass : #Object,
	#instVars : [
		'estado',
		'fechaYHora',
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
Like class >> initializeConUsuario: unUsuario like:unBoolean [
	^ self new initializeConUsuario: unUsuario like: unBoolean
]

{ #category : #'as yet unclassified' }
Like >> esDeUnUsuario: unUsuario [
	^ self usuario == unUsuario
]

{ #category : #'as yet unclassified' }
Like >> estado [
	^ estado
]

{ #category : #initialization }
Like >> initializeConUsuario: unUsuario like: unBoolean [
	usuario := unUsuario.
	fechaYHora := DateAndTime now.
	estado:=unBoolean
]

{ #category : #'as yet unclassified' }
Like >> usuario [
	"Devuelve al usuario que hizo la reacción"

	^ usuario
]
