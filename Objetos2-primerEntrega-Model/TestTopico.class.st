Class {
	#name : #TestTopico,
	#superclass : #TestCase,
	#instVars : [
		'topico'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestTopico >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	topico := Topico nuevoConNombre: 'nuevo' descripcion:'una descripcion' 

	
]

{ #category : #'as yet unclassified' }
TestTopico >> testGetTopico [
	self assert: topico getNombre equals: 'nuevo'
]
