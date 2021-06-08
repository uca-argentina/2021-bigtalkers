Class {
	#name : #BoardSlotGenerator,
	#superclass : #Object,
	#instVars : [
		'slots',
		'randomness',
		'eventsPool'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
BoardSlotGenerator class >> basedOn: eventsDistribution [ 
	
	^self new initializeWith: eventsDistribution.
]

{ #category : #'instance creation' }
BoardSlotGenerator class >> distributing: someEffects havingProbabilities: someProbabilities [

	^ self new initializeWith: someEffects havingProbabilities: someProbabilities.
]

{ #category : #generating }
BoardSlotGenerator >> generates: aNumber [ 
	|events|
	events := OrderedCollection new.
	aNumber timesRepeat: [ events add: (eventsPool atRandom: randomness) ].	
	^events.

]

{ #category : #initialization }
BoardSlotGenerator >> initializeWith: eventsDistribution [ 

	randomness := Random new. 
	eventsPool := OrderedCollection new.
	eventsDistribution do: [:probabilityEvent | eventsPool add: probabilityEvent event withOccurrences: (probabilityEvent 	probability + 100 ) asInteger ].
]

{ #category : #initialize }
BoardSlotGenerator >> initializeWith: someEffects  havingProbabilities: someProbabilities [

	slots := OrderedCollection new.
	someProbabilities
		doWithIndex:
			[ :probability :index | 1 to: probability do: [ :iter | slots add: (someEffects at: index) ] ]
]

{ #category : #'accessing - slots' }
BoardSlotGenerator >> randomSlot [

	^ slots at: (1 to: 100) atRandom
]
