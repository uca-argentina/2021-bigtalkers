Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> test01DiceOneSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 1.
	
	self assert: (aDie sidesAmmount = 1)
]

{ #category : #tests }
DiceTest >> test02DiceTwoSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 2. 
	
	self assert: (aDie sidesAmmount = 2)
]

{ #category : #tests }
DiceTest >> test03DiceTwentySided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 20. 
	
	self assert: (aDie sidesAmmount = 20)
]

{ #category : #tests }
DiceTest >> test04RollTwoSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die new withSides: 2. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 2)
]

{ #category : #tests }
DiceTest >> test05RollTwentySided100Times [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 20. 
	1 to: 100 do: [ :iter| self assert: (aDie roll between: 1 and: 20) ].
]

{ #category : #tests }
DiceTest >> test06RollTwentySided [
	"comment stating purpose of instance-side message"
	"asd: class-variables  &  instance-variables"	
			
	| aDie aRoll|
	aDie := Die new withSides: 20. 
	aRoll := aDie roll.
	self assert: (aRoll between:1 and: 20)
]

{ #category : #tests }
DiceTest >> test07RollDice [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aFourSidedDie aTwoSidedDie someDice|
	aTwoSidedDie := Die new withSides: 2. 
	aFourSidedDie := Die new withSides: 4. 
	
	someDice := Dice new from:{(aTwoSidedDie).(aFourSidedDie)}.
	1 to: 1000 do: [ :iter| self assert: (someDice roll between:1 and: 6) ].
	
]
