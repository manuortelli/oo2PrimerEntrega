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
Quoora class >> InstanciaDePrueba [
	| quoora pedro juan diego topico1 topico2 preguntaDiego preguntaPedro |
	quoora := self soleInstance.
	pedro := quoora
		crearUsuarioNombre: 'pedro@cuoora.com'
		password: 'pedro@cuoora.com'.
	juan := quoora
		crearUsuarioNombre: 'juan@cuoora.com'
		password: 'juan@cuoora.com'.
	diego := quoora
		crearUsuarioNombre: 'diego@cuoora.com'
		password: 'diego@cuoora.com'.
	juan agregarFollower: diego.
	pedro agregarFollower: juan.
	topico1 := OrderedCollection new.
	topico1
		add: 'OO1';
		add: 'Test de unidad'.
	preguntaPedro := quoora
		agregarPreguntaConTopico: topico1
		titulo: '¿Para que sirve el metodo SetUp?'
		descripcion: ''
		usuario: pedro.
	topico2 := OrderedCollection new.
	topico2
		add: 'OO1';
		add: 'Smalltalk'.
	preguntaDiego := quoora
		agregarPreguntaConTopico: topico2
		titulo: '¿Qué significa #messageNotUnderstood?'
		descripcion: ''
		usuario: diego.
	preguntaDiego
		agregarRespuestaConTexto:
			'Significa que el objeto que recibió el mensaje
no encontró ningún método para ejecutar en respuesta'
		usuario: pedro.
	preguntaPedro
		agregarRespuestaConTexto:
			'Sirve para instanciar los objetos que son
evaluados por el test en un único método y que se ejecute
siempre antes de cada test'
		usuario: diego
]

{ #category : #accessing }
Quoora class >> clearSoleInstance [
	soleInstance := nil
]

{ #category : #accessing }
Quoora class >> soleInstance [
	^ soleInstance ifNil: [ soleInstance := self new ]
]

{ #category : #adding }
Quoora >> agregarPreguntaConTopico: unosTopicos titulo: unTitulo descripcion: unaDescripcion usuario: unUsuario [
	| nuevaPregunta colecTopicos |
	colecTopicos := self crearColeccionDeTopicos: unosTopicos.
	nuevaPregunta := Pregunta
		nuevaPreguntaConUsuario: unUsuario
		titulo: unTitulo
		descripcion: unaDescripcion
		topicos: colecTopicos .
	preguntas add: nuevaPregunta.
	topicos addAll: unosTopicos.
	^ nuevaPregunta
]

{ #category : #adding }
Quoora >> agregarTopicoNombre: unNombre descripcion: unaDescripcion [
	"Agrega un topico a la coleccion"

	| topico |
	topico := Topico nuevoConNombre: unNombre descripcion: unaDescripcion.
	topicos add: topico
]

{ #category : #deleting }
Quoora >> borrarPregunta: unaPregunta [
	preguntas remove: unaPregunta.
	
]

{ #category : #'as yet unclassified' }
Quoora >> calcularPuntajeDe: unUsuario [
	"Calcula el puntaje de un usuario"

	"Ya tengo la pregunta del usuario, "

	^ ((self cantidadDePreguntasDeUnUsuario: unUsuario) * 20)
		+ ((self cantidadDeRespuestasDeUnUsuario: unUsuario) * 50)
		+
			(self preguntas
				sumNumbers: [ :pregunta | pregunta likesDeUnUsuario: unUsuario ])
		-
			(self preguntas
				sumNumbers: [ :pregunta | pregunta dislikesDeUnUsuario: unUsuario ])
]

{ #category : #'as yet unclassified' }
Quoora >> cantidadDePreguntasDeUnUsuario: unUsuario [
	"Devuelve la cantidad de preguntas que hizo un usuario"

	^ (self preguntas
		select: [ :pregunta | pregunta esDeUnUsuario: unUsuario ]) size
]

{ #category : #'as yet unclassified' }
Quoora >> cantidadDeRespuestasDeUnUsuario: unUsuario [
	"Devuelve la cantidad de respuestas que hizo un usuario que no sean a preguntas que hizo el mismo"

	^ (self preguntas
		select: [ :pregunta | pregunta usuarioPropietario ~= unUsuario ])
		sumNumbers: [ :pregunta | pregunta cantidadDeRespuestasDe: unUsuario ]
]

{ #category : #'as yet unclassified' }
Quoora >> crearColeccionDeTopicos: unosTopicos [
	^ unosTopicos
		collect: [ :topico | Topico nuevoConNombre: topico descripcion: nil ]
	
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

{ #category : #initialization }
Quoora >> initialize [
	preguntas := OrderedCollection new.
	topicos := Set new.
	usuarios := OrderedCollection new
]

{ #category : #'as yet unclassified' }
Quoora >> obtenerCincoPreguntasRelevantes: unUsuario [
	| preguntasRelevantes |
	preguntasRelevantes := OrderedCollection new.
	preguntasRelevantes := self preguntasRelevantesDeUnUsuario: unUsuario.
	preguntasRelevantes size > 5
		ifFalse: [ ^ preguntasRelevantes ].
	^ preguntasRelevantes first: 5
]

{ #category : #'as yet unclassified' }
Quoora >> preguntas [
	^ preguntas
]

{ #category : #accesing }
Quoora >> preguntasConTopico: unTopico [
	"Devuelve las preguntas que contienen un topico determinado"

	^ self preguntas select: [ :each | each contieneTopico: unTopico  ]
]

{ #category : #accesing }
Quoora >> preguntasDeUnUsuario: unUsuario [
	"Devuelve todas las preguntas que hizo un usuario."
	^ preguntas select: [ :each | each esDeUnUsuario: unUsuario ]
]

{ #category : #accesing }
Quoora >> preguntasRelevantesDeUnUsuario: unUsuario [
	"Se considera relevante una pregunta cuando ésta pertenece a un tópico de interés para el usuario en cuestión 
	o bien cuando fue realizada por alguno de los usuarios que sigue en la red social"

	| total |
	total := Set new.
	total := unUsuario topicosDeInteres
		flatCollect: [ :topico | self preguntasConTopico: topico ].
	total
		addAll:
			(unUsuario followers
				flatCollect: [ :follower | self preguntasDeUnUsuario: follower ]).
	^ total
]

{ #category : #accesing }
Quoora >> respuestasDeUnUsuario: unUsuario [
	"Devuelve todas las respuestas de un usuario"

	^ (preguntas flatCollect: [ :pregunta | pregunta respuestas ])
		select: [ :respuesta | respuesta esDeUnUsuario: unUsuario ]
]

{ #category : #adding }
Quoora >> usuario: unUsuario protegidoPor: unaPassword [
	^ usuarios
		detect: [ :each | each nombre = unUsuario & (each password = unaPassword) ]
		ifNone: [ nil ]
]

{ #category : #deleting }
Quoora >> usuarioQueMacheCon: aString [
	"Busca si existe el usuario a la hora del login"
	^ usuarios
		select:
			[ :each | each name asLowercase includesSubstring: aString asLowercase ]
]
