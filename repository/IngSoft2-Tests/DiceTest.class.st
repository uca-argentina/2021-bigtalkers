Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
DiceTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #tests }
DiceTest >> testADieCannotHaveNegativeSides [

	self
		should: [ Die withSides: 2 ]
		raise: Error
		withMessage: 'Dice have to have at least 4 sides'
]

{ #category : #tests }
DiceTest >> testEmptyDiceSetThrowsError [

	self
		should: [ Dice with: {} ]
		raise: Error
		withMessage: 'Dice need to have at least one Die'
]

{ #category : #tests }
DiceTest >> testLoadedDiceRollsExpectedValue [

	| aFourSidedDie aTwoSidedDie someDice |
	aTwoSidedDie := LoadedDie rolling: 2.
	aFourSidedDie := LoadedDie rolling: 4.
	someDice := Dice
		with:
			{aTwoSidedDie.
			aFourSidedDie}.
	self assert: someDice roll equals: 6
]

{ #category : #tests }
DiceTest >> testLoadedDieCannotHaveNegativeResult [

	self
		should: [ LoadedDie rolling: -1 ]
		raise: Error
		withMessage: 'A loaded die cannot have a negative result'
]

{ #category : #tests }
DiceTest >> testRollingDieWithFourSidesRollsBetween1and4 [

	| aDie aRoll |
	aDie := Die withSides: 4.
	aRoll := aDie roll.
	self assert: (aRoll between: 1 and: 4)
]

{ #category : #tests }
DiceTest >> testTwoDiceWithFourSidesRollBetween2and8 [

	| aFourSidedDie anotherFourSidedDie someDice |
	aFourSidedDie := Die withSides: 4.
	anotherFourSidedDie := Die withSides: 4.
	someDice := Dice
		with:
			{anotherFourSidedDie.
			aFourSidedDie}.
	self assert: (someDice roll between: 2 and: 8)
]
