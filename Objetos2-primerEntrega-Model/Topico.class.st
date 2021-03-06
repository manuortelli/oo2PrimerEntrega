Class {
	#name : #Topico,
	#superclass : #Object,
	#instVars : [
		'nombre',
		'descripcion'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #initialization }
Topico class >> nuevoConNombre: unNombre descripcion: unaDescripcion [
	^ self new
		initializeTopicoConNombre: unNombre
		descripcion: unaDescripcion
]

{ #category : #comparing }
Topico >> = unTopico [
	^ self nombre = unTopico nombre
]

{ #category : #initialization }
Topico >> initializeTopicoConNombre: unNombre descripcion: unaDescripcion [
	nombre:= unNombre .
	descripcion := unaDescripcion 
]

{ #category : #accesing }
Topico >> nombre [
	^ nombre
]
