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
DiceTest >> testNonExistantDie [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	

	self should: [ Die withSides: 2. ] 
	raise: Error
	withMessage: 'Dice have to have at least 4 sides'.
	
]

{ #category : #tests }
DiceTest >> testRollDice [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie anotherFourSidedDie someDice|
	aFourSidedDie := Die withSides: 4. 
	anotherFourSidedDie := Die withSides: 4. 
	
	someDice := Dice with:{(anotherFourSidedDie).(aFourSidedDie)}.
	1 to: 1000 do: [ :iter| self assert: (someDice roll between:2 and: 8) ].
	
]

{ #category : #tests }
DiceTest >> testRollFourSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die withSides: 4. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 4)
]

{ #category : #tests }
DiceTest >> testRollLoadedDice [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie aTwoSidedDie someDice|
	aTwoSidedDie := LoadedDie withSides: 2. 
	aFourSidedDie := LoadedDie withSides: 4. 
	
	someDice := Dice with:{(aTwoSidedDie).(aFourSidedDie)}.
	1 to: 1000 do: [ :iter| self assert: (someDice roll ) equals: 6 ].
	
]

{ #category : #tests }
DiceTest >> testRollTwentySided [
	"comment stating purpose of instance-side message"
	"asd: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die withSides: 20. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 20)
]

{ #category : #tests }
DiceTest >> testRollTwentySided100Times [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die withSides: 20. 
	1 to: 100 do: [ :iter| self assert: (aDie roll between: 1 and: 20) ].
]
