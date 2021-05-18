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
Board class >> sized: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsing: aNumberOfSlots
]

{ #category : #'instance creation' }
Board class >> sized: aNumberOfSlots seeding: aSeedGenerator [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsing: aNumberOfSlots and: aSeedGenerator
]

{ #category : #'tests - instance creation' }
Board class >> sizedForTestingMoonWalk: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsingMoonWalkTestBoard: aNumberOfSlots
]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #'accessing - slots' }
Board >> effectAt: aPosition [

	^ (self slotAt: aPosition) getEffect
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [

	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ]
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots and: aSeed [

	seedGenerator := aSeed.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: seedGenerator getRandomSlot ]
]

{ #category : #'accessing - initialization' }
Board >> initializeUsingMoonWalkTestBoard: aNumberOfSlots [

	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ].
	slots at: 4 put: BoardSlot withMoonwalk 
]

{ #category : #'accessing - slots' }
Board >> slotAt: aPosition [

	^ slots at: aPosition
]

{ #category : #'accessing - slots' }
Board >> slotsAmount [

	^ slots size
]
