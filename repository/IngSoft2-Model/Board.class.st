Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots',
		'seedGenerator'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> sized: aNumberOfSlots seeding: aSeedGenerator [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsing: aNumberOfSlots and: aSeedGenerator
]

{ #category : #'fixed instance creation' }
Board class >> sizedForTestingMoonWalk: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsingMoonWalkTestBoard: aNumberOfSlots
]

{ #category : #'instance creation' }
Board class >> sizedWithNoEffects: aNumberOfSlots [
	| slots |
	self validateMinimumSlots: aNumberOfSlots.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect  ].
	^ self new initializeUsingEffects: slots
]

{ #category : #'instance creation' }
Board class >> sizedWithRandomEffects: aNumberOfSlots fromSeed: aSeed [

	| slots |
	self validateMinimumSlots: aNumberOfSlots.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add:  aSeed getRandomSlot ].
	^ self new initializeUsingEffects: slots
]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #'instance creation' }
Board class >> withAll: aCollectionOfSlots [

	^ self new initializeUsingEffects: aCollectionOfSlots
]

{ #category : #'accessing - slots' }
Board >> effectAt: aPosition [

	^ (self slotAt: aPosition) getEffect
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots and: aSeed [

	seedGenerator := aSeed.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: seedGenerator getRandomSlot ]
]

{ #category : #initialize }
Board >> initializeUsingEffects: aCollectionOfSlots [

	slots := OrderedCollection new.
	aCollectionOfSlots do: [ :slot | slots add: slot ]
]

{ #category : #'accessing - slots' }
Board >> slotAt: aPosition [

	^ slots at: aPosition
]

{ #category : #'accessing - slots' }
Board >> slotsAmount [

	^ slots size
]
