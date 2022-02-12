Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#instVars : [
		'effects'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #tests }
BoardTest >> testBoardCannotBeCreatedWithZeroSlots [

	self
		should: [ Board sizedWithNoEffects: 0 ]
		raise: Error
		withMessage: 'Boards need at least one slot'
]

{ #category : #tests }
BoardTest >> testBoardSlotGeneratorCannotBeBasedOnAnEventDistributionWithTotalProbabilitiesDifferentThanOne [

	| eventsDistribution |
	eventsDistribution := OrderedCollection new.
	eventsDistribution
		add: (DiscreteProbabilityEvent of: BoardSlot withNoEffect with: 0.38);
		add: (DiscreteProbabilityEvent of: BoardSlot withSpeedUp with: 0.2);
		add: (DiscreteProbabilityEvent of: BoardSlot withWormHole with: 0.2);
		add: (DiscreteProbabilityEvent of: BoardSlot withMoonwalkWithFixedValue with: 0.3);
		add: (DiscreteProbabilityEvent of: BoardSlot withAtomicBomb with: 0.02);
		add: (DiscreteProbabilityEvent of: BoardSlot withGrabCard with: 0.10).
		
	self
		should: [ BoardSlotGenerator basedOn: eventsDistribution ]
		raise: Error
		withMessage: 'All probabilities must sum 1'
]

{ #category : #tests }
BoardTest >> testDiscreteProbabilityEventCannotHaveNegativeProbabilites [

	self
		should: [ DiscreteProbabilityEvent of: BoardSlot withNoEffect with: -0.38 ]
		raise: Error
		withMessage: 'Probabilities must be positive'
]
