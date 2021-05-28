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
BoardTest >> testCreateBoard [

	| aBoard |
	aBoard := Board sizedWithNoEffects: 30.
	self assert: aBoard slotsAmount equals: 30
]

{ #category : #tests }
BoardTest >> testCreateBoardWithSeed [

	| aBoard aSeedGenerator effectsUsed |
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := Board sized: 30 seeding: aSeedGenerator.
	self assert: aBoard slotsAmount equals: 30
]

{ #category : #tests }
BoardTest >> testCreateBoardWithZeroSlots [

	self
		should: [ Board sizedWithNoEffects: 0 ]
		raise: Error
		withMessage: 'Boards need at least one slot'
]

{ #category : #tests }
BoardTest >> testCreateFixedBoard [

	| aBoard aSeedGenerator effectsUsed |
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := FixedBoard seeding: aSeedGenerator.
	self assert: ((aBoard effectAt: 20) isKindOf: NoEffect).
	self assert: ((aBoard effectAt: 50) isKindOf: WormHole).
	self assert: ((aBoard effectAt: 99) isKindOf: AtomicBomb)
]
