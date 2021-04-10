Class {
	#name : #DiceTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
DiceTest >> testDiceOneSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 1.
	
	self assert: (aDie sidesAmmount = 1)
]

{ #category : #tests }
DiceTest >> testDiceTwoSided [
	"comment stating purpose of instance-side message"
	"scope: class-variables  &  instance-variables"	
			
	| aDie |
	aDie := Die new withSides: 2. 
	
	self assert: (aDie sidesAmmount = 2)
]
