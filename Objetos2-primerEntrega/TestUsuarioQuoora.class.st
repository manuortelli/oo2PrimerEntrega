Class {
	#name : #TestUsuarioQuoora,
	#superclass : #TestCase,
	#instVars : [
		'usuario'
	],
	#category : #'Objetos2-primerEntrega'
}

{ #category : #running }
TestUsuarioQuoora >> setUp [
	"Hooks that subclasses may override to define the fixture of test."
	usuario := UsuarioQuoora initializeConNombre: 'Manuel' password: 'Sabelobelo' 
	
]

{ #category : #tests }
TestUsuarioQuoora >> testAgregarFollower [
	| usuario2 usuario3 |
	usuario2 := UsuarioQuoora
		initializeConNombre: 'Arturo'
		password: 'UnPichicho'.
	usuario agregarFollower: usuario2.
	self assert: usuario getFollowers size equals: 1.
	usuario3 := UsuarioQuoora
		initializeConNombre: 'Nose'
		password: 'UnPichicho2'.
	usuario agregarFollower: usuario3.
	self assert: usuario getFollowers size equals: 2
]

{ #category : #tests }
TestUsuarioQuoora >> testAgregarTopicoDeInteres [
	| topico topico2|
	topico := Topico
		nuevoConNombre: 'Moda'
		descripcion: 'Un poco sobre moda'.
	usuario agregarTopicoDeinteres: topico.
	topico2 := Topico
		nuevoConNombre: 'Basket'
		descripcion: 'Un poco sobre basket'.
	usuario agregarTopicoDeinteres: topico2.
	self assert: usuario topicosDeInteres size equals: 2
]
