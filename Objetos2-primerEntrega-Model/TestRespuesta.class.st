Class {
	#name : #TestRespuesta,
	#superclass : #TestCase,
	#instVars : [
		'respuesta'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestRespuesta >> setUp [
	respuesta := Respuesta nuevaConTexto: 'La respuesta magica' usuario: 'Poxy1' 

	
]
