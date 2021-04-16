Class {
	#name : #Quoora,
	#superclass : #Object,
	#instVars : [
		'preguntas',
		'topicos',
		'usuarios'
	],
	#classInstVars : [
		'soleInstance'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #accessing }
Quoora class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #accessing }
Quoora class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #adding }
Quoora >> agregarFollower: unFollower usuario:unUsuario [ 
	unUsuario agregarFollower: unFollower .
]

{ #category : #adding }
Quoora >> agregarFollowerName: unFollowerName usuario: unUsuario [
	| us |
	us := self usuarioQueMacheCon: unFollowerName.
	us ifNotNil: [	unUsuario agregarFollower: us ] 
]

{ #category : #adding }
Quoora >> agregarLikePregunta: unaPregunta usuario: unUsuario estado: unBoolean [
	
	unaPregunta agregarLike: unUsuario estado: unBoolean  
		
]

{ #category : #adding }
Quoora >> agregarLikeRespuesta: unaRespuesta usuario:unUsuario [
	unaRespuesta agregarLike: unUsuario
]

{ #category : #adding }
Quoora >> agregarPreguntaConTopico: unosTopicos titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
	| nuevaPregunta |
	nuevaPregunta := Pregunta
		nuevaPreguntaConUsuario: unUsuario
		titulo: unTitulo
		descripcion: unaDescripcion
		topicos: unosTopicos.
	preguntas add: nuevaPregunta.
	topicos addAll: unosTopicos.
	unUsuario agregarPregunta: nuevaPregunta.
	^ nuevaPregunta
]

{ #category : #adding }
Quoora >> agregarRespuestaConPregunta: unaPregunta texto:unTexto usuario:unUsuario [
	
	unaPregunta agregarRespuestaConTexto: unTexto usuario: unUsuario  
]

{ #category : #adding }
Quoora >> agregarTopicoNombre: unNombre descripcion:unaDescripcion [
	topicos add: (Topico nuevoConNombre: unNombre descripcion: unaDescripcion )
]

{ #category : #adding }
Quoora >> agregarTopicoNombre: unNombre descripcion: unaDescripcion usuario: unUsuario [
	| topi |
	topi := Topico nuevoConNombre: unNombre descripcion: unaDescripcion . 
	unUsuario agregarTopicoDeinteres: topi.
	topicos add: topi
]

{ #category : #deleting }
Quoora >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta 
]

{ #category : #'as yet unclassified' }
Quoora >> calcularPuntajeDe: unUsuario [
	^ unUsuario getPreguntas size * 20
		+ ((self getCantidadDeRespuestasDeUnUsuario: unUsuario) * 50) + (self getPreguntas sumNumbers: [ :pregunta | preguntas getLikesDeUnUsuario: unUsuario ]) +
		self getPreguntas sumNumbers: [ :pregunta | pregunta getDislikesDeUnUsuario: unUsuario ] 
]

{ #category : #adding }
Quoora >> crearUsuarioNombre: unNombre password: unaPassword [
	| unUsuario |
	unUsuario := UsuarioQuoora
		initializeConNombre: unNombre
		password: unaPassword.
	usuarios add: unUsuario.
	^ unUsuario
]

{ #category : #'as yet unclassified' }
Quoora >> getCantidadDeRespuestasDeUnUsuario: unUsuario [
	"Devuelve la cantidad de respuestas que hizo un usuario que no sean a preguntas que hizo el mismo"
	(self getPreguntas collect:[:pregunta | pregunta usuarioPropietario ~= unUsuario ]) sumNumbers: [ :pregunta | pregunta cantidadDeRespuestasDe: unUsuario ]
]

{ #category : #'as yet unclassified' }
Quoora >> getPreguntas [
	^ preguntas
]

{ #category : #accesing }
Quoora >> getPreguntasConTopico: unTopico [
	^ preguntas select: [ :each | each getTopico == unTopico ]
]

{ #category : #accesing }
Quoora >> getPreguntasDeUnUsuario: unUsuario [
	| pregunta |
	pregunta := preguntas
		select: [ :each | 
			each usuarioPropietario = unUsuario].
	^ pregunta
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
	^ respuestas
		select: [ :each | each usuarioPropietario == unUsuario ]
]

{ #category : #initialization }
Quoora >> initialize [
	preguntas := OrderedCollection new.
	topicos := OrderedCollection  new.
	usuarios := OrderedCollection  new
]

{ #category : #adding }
Quoora >> usuario: unUsuario protegidoPor: unaPassword [
	^ usuarios
		detect:
			[ :each | each nombreUsuario = unUsuario & (each password = unaPassword) ]
		ifNone: [ nil ]
]

{ #category : #deleting }
Quoora >> usuarioQueMacheCon: aString [
	^ usuarios
		select:
			[ :each | each name asLowercase includesSubstring: aString asLowercase ]
]
