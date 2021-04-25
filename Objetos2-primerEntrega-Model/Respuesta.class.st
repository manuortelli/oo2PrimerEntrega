Class {
	#name : #Respuesta,
	#superclass : #Interaccion,
	#instVars : [
		'texto'
	],
	#category : #'Objetos2-primerEntrega-Model-Dominio'
}

{ #category : #adding }
Respuesta class >> nuevaConTexto: unTexto usuario:unUsuario [
	^ self new initializeConTexto: unTexto usuario: unUsuario.
]

{ #category : #query }
Respuesta >> dislikesDeUnUsuario: unUsuario [
	"devuelve la cantidad de Dislikes de un Usuario"

	^ ((self reaccionesDeUnUsuario: unUsuario)
		reject: [ :reaccion | reaccion estado ]) size
]

{ #category : #initialization }
Respuesta >> initializeConTexto: unTexto usuario: unUsuario [
	texto := unTexto.
	usuarioCreador := unUsuario.

]

{ #category : #query }
Respuesta >> likesDeUnUsuario: unUsuario [
	^ ((self reaccionesDeUnUsuario: unUsuario)
		select: [ :reaccion | reaccion estado ]) size
]

{ #category : #query }
Respuesta >> puntaje [
	"devuelve la diferencia entre likes y dislikes"
	^self cantidadLikes - self cantidadDislikes 
	
]
