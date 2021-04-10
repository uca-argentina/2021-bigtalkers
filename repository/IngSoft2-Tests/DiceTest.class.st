Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testDiceOneSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDice |
	aDice := Die new withSides: 1.
	
	self assert: (aDice sidesAmmount = 1)
]

{ #category : #tests }
DiceTest >> testDiceTwoSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDice |
	aDice := Die new withSides: 2. 
	
	self assert: (aDice sidesAmmount = 2)
]
