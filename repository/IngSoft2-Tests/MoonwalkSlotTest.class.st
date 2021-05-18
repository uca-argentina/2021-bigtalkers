Class {
	#name : #MoonwalkSlotTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
MoonwalkSlotTest >> testCreateAMoonwalkSlotWithFixedN [

	| aBoardSlotWithMoonwalkEffect |
	aBoardSlotWithMoonwalkEffect := BoardSlot withMoonwalkWithFixedValue.
	self assert: aBoardSlotWithMoonwalkEffect getN equals: 2 .
]

{ #category : #tests }
MoonwalkSlotTest >> testCreateAMoonwalkSlotWithRandomNSettingAMaximum [ 

	| aBoardSlotWithMoonwalkEffect |
	aBoardSlotWithMoonwalkEffect := BoardSlot withMoonwalkWithRandomValue.
	self assert: (aBoardSlotWithMoonwalkEffect getN  between: 1 and: 5).
]
