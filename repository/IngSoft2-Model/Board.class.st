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

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #'testing - slots' }
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

{ #category : #'testing - slots' }
Board >> slotAt: aPosition [

	^ slots at: aPosition
]

{ #category : #'testing - slots' }
Board >> slotsAmount [

	^ slots size
]
