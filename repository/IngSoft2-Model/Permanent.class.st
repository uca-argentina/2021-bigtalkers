Class {
	#name : #Permanent,
	#superclass : #Card,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Permanent >> applyOn: aGame to: affected [

	^ self subclassResponsibility
]

{ #category : #'accessing - effect' }
Permanent >> effect [

	^ self subclassResponsibility
]
