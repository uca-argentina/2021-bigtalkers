Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'N'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Moonwalk class >> withStepsBack: aNumber [

	^ self new initializeWithN: aNumber
]

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame triggeredBy: target [ 

	aGame applyMoonWalk: N toPlayer: target 
]

{ #category : #initialization }
Moonwalk >> initializeWithN: aNumber [

	N := aNumber
]
