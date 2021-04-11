Class {
	#name : #SesionConUsuario,
	#superclass : #WASession,
	#instVars : [
		'quoora',
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
SesionConUsuario >> quoora [
	^ quoora
]

{ #category : #accessing }
SesionConUsuario >> quoora: unQuoora [
	quoora := unQuoora
]

{ #category : #accessing }
SesionConUsuario >> usuario [
	^ usuario
]

{ #category : #accessing }
SesionConUsuario >> usuario: unUsuario [
	usuario := unUsuario.

]
