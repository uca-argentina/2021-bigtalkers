Class {
	#name : #BoardTest,
	#superclass : #TestCase,
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
BoardTest >> testCreateBoard [

	| aBoard |
	aBoard := Board sized: 30.
	self assert: aBoard slotsAmount equals: 30
]

{ #category : #tests }
BoardTest >> testCreateBoardWithSeed [
	| aBoard aSeed |
	aSeed := SeedGenerator withFiveProbabilities: #(48 20 20 10 2). 
	aBoard := Board sized: 30 withSeed: aSeed.
	self assert: aBoard slotsAmount equals: 30.
]

{ #category : #tests }
BoardTest >> testCreateBoardWithZeroSlots [

	self
		should: [ Board sized: 0 ]
		raise: Error
		withMessage: 'Boards need at least one slot'
]

{ #category : #tests }
BoardTest >> testCreateLoadedBoard [

	| aBoard aSeed |
	aSeed := SeedGenerator withFiveProbabilities: #(48 20 20 10 2).
	aBoard := LoadedBoard using: aSeed.
	self assert: ((aBoard effectAt: 20) isKindOf: NoEffect).
	self assert: ((aBoard effectAt: 50) isKindOf: WormHole).
	self assert: ((aBoard effectAt: 99) isKindOf: AtomicBomb).
]
