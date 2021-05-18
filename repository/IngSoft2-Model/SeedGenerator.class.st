Class {
	#name : #SeedGenerator,
	#superclass : #Object,
	#instVars : [
		'slots'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SeedGenerator class >> distributing: someEffects havingProbabilities: someProbabilities [

	^ self new initializeWith: someEffects havingProbabilities: someProbabilities.
]

{ #category : #'accessing - slots' }
SeedGenerator >> getAllSlots [

	^ slots
]

{ #category : #'accessing - slots' }
SeedGenerator >> getRandomSlot [

	^ slots at: (1 to: 100) atRandom
]

{ #category : #initialize }
SeedGenerator >> initializeWith: someEffects  havingProbabilities: someProbabilities [

	slots := OrderedCollection new.
	someProbabilities
		doWithIndex:
			[ :probability :index | 1 to: probability do: [ :iter | slots add: (someEffects at: index) ] ]
]
