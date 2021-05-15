Class {
	#name : #SeedGenerator,
	#superclass : #Object,
	#instVars : [
		'arrayWithSlots',
		'effects'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
SeedGenerator class >> withFiveProbabilities: someProbabilities [ 

	^self new initializeWith: someProbabilities
]

{ #category : #accessing }
SeedGenerator >> getRandomSlot [

	^ arrayWithSlots at: (1 to:100 atRandom)
]

{ #category : #initialize }
SeedGenerator >> initializeWith: someProbabilities [

	effects := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalk.
	BoardSlot withAtomicBomb}.
	arrayWithSlots := Array new.
	someProbabilities
		do:
			[ :probability | 1 to: probability do: [ arrayWithSlots add: (effects at: probability index) ] ]
]
