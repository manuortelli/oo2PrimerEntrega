Class {
	#name : #TestPregunta,
	#superclass : #TestCase,
	#instVars : [
		'pregunta'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #running }
TestPregunta >> setUp [
	"Hooks that subclasses may override to define the fixture of test."

	pregunta := Pregunta 		
		nuevaPreguntaConUsuario: 'Carlos'
		titulo: 'Juegos de azar? '
		descripcion: 'Manejos en los juegos de azar'
]

{ #category : #tests }
TestPregunta >> testAgregarLike [
	| usuario |
	usuario := UsuarioQuoora
		initializeConNombre: 'Manuel'
		password: 'Sabelobelo'.
	pregunta agregarLike: usuario.
	self assert: (pregunta getLikes ) size equals:1
]

{ #category : #tests }
TestPregunta >> testAgregarRespuestaConTexto: unTexto unUsuario: usuario1 [
	pregunta
		agregarRespuestaConTexto: 'La respuesta esperada por todos'
			usuario: 'Carlitos23';
		agregarRespuestaConTexto: 'Esa respuesta no era la que esperaba'
			usuario: 'Poxy1'.
	self assert: pregunta getRespuestas size equals: 2.
	pregunta agregarRespuestaConTexto: 'La verdad que podrias esforzarte mas en un respuesta clara' usuario: 'Carlitos23'.
	self deny: pregunta getRespuestas size equals: 2.
]

{ #category : #tests }
TestPregunta >> testAgregarTopico [
	pregunta
		agregarTopico: 'Azar';
		agregarTopico: 'Juegos';
		agregarTopico: 'Motos'.
	self assert: pregunta getTopico size equals: 3.
	pregunta agregarTopico: 'Gatos'.
	self deny: pregunta getTopico size equals: 3
]
