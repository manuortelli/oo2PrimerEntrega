"
I store metadata for this package. These meta data are used by other tools such as the SmalllintManifestChecker and the critics Browser
"
Class {
	#name : #ManifestObjetosprimerEntregaModel,
	#superclass : #PackageManifest,
	#category : #'Objetos2-primerEntrega-Model-Manifest'
}

{ #category : #'code-critics' }
ManifestObjetosprimerEntregaModel class >> ruleRBSendsUnknownMessageToGlobalRuleV1FalsePositive [
	^ #(#(#(#RGMethodDefinition #(#Interaccion #agregarLike:estado: #false)) #'2021-04-14T23:55:55.250213-03:00') )
]
