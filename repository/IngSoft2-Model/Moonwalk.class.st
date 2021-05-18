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

	^ self new fixedN: aNumber
]

{ #category : #'instance creation' }
Moonwalk class >> withMaxValue: aNumber [

	^ self new setN: aNumber
]

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame [

	aGame applyMoonWalk: N
]

{ #category : #initialization }
Moonwalk >> fixedN: aNumber [

	N := aNumber
]

{ #category : #'accessing - N' }
Moonwalk >> getN [

	^N
]

{ #category : #initialization }
Moonwalk >> setN: maxValue [

	N := (1 to: maxValue) atRandom
]
