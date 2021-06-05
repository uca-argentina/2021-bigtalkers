Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'N'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Moonwalk class >> withFixedValue: aNumber [

	^ self new initializeWithN: aNumber
]

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame [

	aGame applyMoonWalk: N
]

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame toPlayer: aPlayer [

	aGame applyMoonWalk: N toPlayer: aPlayer. 
]

{ #category : #initialization }
Moonwalk >> initializeWithN: aNumber [

	N := aNumber
]
