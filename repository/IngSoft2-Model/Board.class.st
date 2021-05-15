Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots',
		'seed'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> boardTestSized: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsingEffectTests: aNumberOfSlots
]

{ #category : #'instance creation' }
Board class >> sized: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots.
	^ self new initializeUsing: aNumberOfSlots
]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #accessing }
Board >> effectAt: aPosition [

	^ (self slotAt: aPosition) getEffect
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [

	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ]
]

{ #category : #'testing - initialization' }
Board >> initializeUsingEffectTests2: aNumberOfSlots [

	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: seed getRandomSlot  ].
]

{ #category : #'testing - initialization' }
Board >> initializeUsingEffectTests: aNumberOfSlots [

	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: seed getSlot ].
	slots at: 4 put: BoardSlot withSpeedUp.
	slots at: 5 put: BoardSlot withWormHole.
	slots at: 6 put: BoardSlot withMoonwalk.
	slots at: 7 put: BoardSlot withAtomicBomb
]

{ #category : #accessing }
Board >> slotAt: aPosition [

	^ slots at: aPosition
]

{ #category : #'testing - variables' }
Board >> slotsAmount [

	^ slots size
]
