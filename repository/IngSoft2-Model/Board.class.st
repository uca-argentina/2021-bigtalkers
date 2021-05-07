Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots'
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
		ifFalse: [ Error signal: 'Boards need at least one slot' ].
]

{ #category : #accessing }
Board >> effectAt: aPosition [
	^ (self slotAt: aPosition) getEffect
]

{ #category : #accessing }
Board >> effectNameAt: aPosition [
	^ (self slotAt: aPosition) getEffectName 
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ].

]

{ #category : #initialize }
Board >> initializeUsingEffectTests: aNumberOfSlots [
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ].
	slots at: 4 put: BoardSlot withSpeedUp.
	slots at: 5 put: BoardSlot withWormHole.  

]

{ #category : #accessing }
Board >> slotAt: aPosition [
	^ (slots at: aPosition).
]

{ #category : #'testing - variables' }
Board >> slotsAmount [
	^ slots size
]
