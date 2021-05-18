Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'N'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
Moonwalk class >> withFixedValue: aNumber [
	^ self new fixedN: aNumber
]

{ #category : #'as yet unclassified' }
Moonwalk class >> withMaxValue: aNumber [

 ^self new setN: aNumber
]

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame [

	aGame applyMoonWalk: N
]

{ #category : #initialization }
Moonwalk >> fixedN: aNumber [

	N := aNumber
]

{ #category : #initialization }
Moonwalk >> setN: maxValue [

	N := (1 to: maxValue) atRandom
]
