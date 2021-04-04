Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-primerEntrega'
}

{ #category : #initialization }
Topico class >> nuevoConNombre: unNombre descripcion: unaDescripcion [
	^ self new
		initializeTopicoConNombre: unNombre
		descripcion: unaDescripcion
]

{ #category : #accesing }
Topico >> getNombre [
	^ nombre
]

{ #category : #initialization }
Topico >> initializeTopicoConNombre: unNombre descripcion: unaDescripcion [
	nombre:= unNombre .
	descripcion := unaDescripcion 
]
