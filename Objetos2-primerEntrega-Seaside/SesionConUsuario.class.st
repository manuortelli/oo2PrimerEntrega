Class {
	#name : #SesionConUsuario,
	#superclass : #WASession,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-primerEntrega-Seaside'
}

{ #category : #accessing }
SesionConUsuario >> usuario [
	^ usuario
]

{ #category : #accessing }
SesionConUsuario >> usuario: unUsuario [
	usuario := unUsuario.

]
