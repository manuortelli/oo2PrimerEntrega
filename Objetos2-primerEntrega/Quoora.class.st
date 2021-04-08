Class {
	#name : #Quoora,
	#superclass : #Object,
	#instVars : [
		'preguntas',
		'topicos',
		'usuarios'
	],
	#category : #'Objetos2-primerEntrega'
}

{ #category : #'as yet unclassified' }
Quoora >> CalcularPuntajeDe: unUsuario [
	| preg |
	preg := (self getPreguntasDeUnUsuario: unUsuario) size * 20
]

{ #category : #adding }
Quoora >> agregarFollower: unFollower usuario:unUsuario [ 
	unUsuario agregarFollower: unFollower .
]

{ #category : #adding }
Quoora >> agregarLikePregunta: unaPregunta usuario: unUsuario [
	unaPregunta agregarLikeDe: unUsuario
]

{ #category : #adding }
Quoora >> agregarLikeRespuesta: unaRespuesta usuario:unUsuario [
	unaRespuesta agregarLike: unUsuario
]

{ #category : #adding }
Quoora >> agregarPreguntaConTopico: unTopico titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
	| nuevaPregunta |
	nuevaPregunta := Pregunta
		nuevaPreguntaConUsuario: unUsuario
		titulo: unTitulo
		descripcion: unaDescripcion.
	nuevaPregunta agregarTopico: unTopico.
	preguntas add: nuevaPregunta
]

{ #category : #adding }
Quoora >> agregarRespuestaConPregunta: unaPregunta texto:unTexto usuario:unUsuario [
	
	unaPregunta agregarRespuestaConTexto: unTexto usuario: unUsuario  
]

{ #category : #adding }
Quoora >> agregarTopicoNombre: unNombre descripcion:unaDescripcion [
	topicos add: (Topico nuevoConNombre: unNombre descripcion: unaDescripcion )
]

{ #category : #deleting }
Quoora >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta 
]

{ #category : #adding }
Quoora >> crearUsuarioNombre: unNombre password: unaPassword [
	^ usuarios
		add: (UsuarioQuoora initializeConNombre: unNombre password: unaPassword)
		
]

{ #category : #accesing }
Quoora >> getPreguntasConTopico: unTopico [
	^ preguntas collect: [ :each | each getTopico = unTopico ]
]

{ #category : #accesing }
Quoora >> getPreguntasDeUnUsuario:unUsuario [
	^preguntas collect: [:each | each usuarioPropietario = unUsuario ]
]

{ #category : #accesing }
Quoora >> getPreguntasRelevantesDeUnUsuario:unUsuario [
	
]

{ #category : #accesing }
Quoora >> getRespuestas: unaPregunta [
	^ unaPregunta getRespuestas
]

{ #category : #accesing }
Quoora >> getRespuestasDeUnUsuario: unUsuario [
	| respuestas |
	respuestas := preguntas collect: [ :each | each getRespuestas ].
	^respuestas collect: [ :each | each usuarioPropietario =unUsuario ]
]

{ #category : #initialization }
Quoora >> initialize [ 
	preguntas := OrderedCollection new.
	topicos := Set new.
	usuarios := Set new.
]
