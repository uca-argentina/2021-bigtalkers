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

{ #category : #'instance creation' }
BoardSlotGenerator class >> basedOn: eventsDistribution [

	self validate: eventsDistribution.
	^ self new initializeWith: eventsDistribution.
]

{ #category : #validation }
BoardSlotGenerator class >> validate: eventsDistribution [

	self validateTotalProbability: eventsDistribution
]

{ #category : #validation }
BoardSlotGenerator class >> validateTotalProbability: eventsDistribution [

	| probabilities totalProbability |
	probabilities := eventsDistribution
		collect: [ :event | event probability ].
	totalProbability := probabilities
		inject: 0
		into: [ :sum :each | sum + each ].
	totalProbability = 1
		ifFalse: [ Error signal: 'All probabilities must sum 1' ]
]

{ #category : #generating }
BoardSlotGenerator >> generate [

	| events |
	events := OrderedCollection new.
	^ eventsPool atRandom: randomness
]

{ #category : #initialization }
BoardSlotGenerator >> initializeWith: eventsDistribution [
	"Coverage issue: Message in use in BoardSlotGenerator class >> basedOn: "
	randomness := Random new.
	eventsPool := OrderedCollection new.
	eventsDistribution
		do: [ :probabilityEvent | 
			eventsPool
				add: probabilityEvent event
				withOccurrences: (probabilityEvent probability * 100) asInteger ]
]
