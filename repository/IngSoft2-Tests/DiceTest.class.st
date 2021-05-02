Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [  
	self 
		should: anErrorBlock
		raise: exceptionClass 
		withExceptionDo: 
			[ :error | self assert: error messageText equals: expectedErrorMessage  ].
]

{ #category : #tests }
DiceTest >> testEmptyDiceSetThrowsError [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
	
	self should: [ Dice with: {}] 
	raise: Error
	withMessage: 'Dice need to have at least one Die'.
	
]

{ #category : #tests }
DiceTest >> testLoadedDiceRollsExpectedValue [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie aTwoSidedDie someDice|
	aTwoSidedDie := LoadedDie rolling: 2. 
	aFourSidedDie := LoadedDie rolling: 4. 
	
	someDice := Dice with:{(aTwoSidedDie).(aFourSidedDie)}.
	100 timesRepeat:  [ self assert: (someDice roll ) equals: 6 ].
	
]

{ #category : #tests }
DiceTest >> testNonExistantDieThrowsError [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	

	self should: [ Die withSides: 2. ] 
	raise: Error
	withMessage: 'Dice have to have at least 4 sides'.
	
]

{ #category : #tests }
DiceTest >> testRollingD4RollsBetween1and4 [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die withSides: 4. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 4)
]

{ #category : #tests }
DiceTest >> testTwoD4RollBetween2and8 [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie anotherFourSidedDie someDice|
	aFourSidedDie := Die withSides: 4. 
	anotherFourSidedDie := Die withSides: 4. 
	
	someDice := Dice with:{(anotherFourSidedDie).(aFourSidedDie)}.
	100 timesRepeat: [self assert: (someDice roll between:2 and: 8) ].
	
]
