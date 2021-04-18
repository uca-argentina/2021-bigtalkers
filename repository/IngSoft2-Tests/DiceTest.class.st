Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testRollDice [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie aTwoSidedDie someDice|
	aTwoSidedDie := Die withSides: 2. 
	aFourSidedDie := Die withSides: 4. 
	
	someDice := Dice with:{(aTwoSidedDie).(aFourSidedDie)}.
	1 to: 1000 do: [ :iter| self assert: (someDice roll between:1 and: 6) ].
	
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

{ #category : #tests }
DiceTest >> testRollTwoSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die withSides: 2. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 2)
]
