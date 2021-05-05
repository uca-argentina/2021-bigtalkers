Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots'
	],
	#category : #'IngSoft2-Model'
}

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

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [

	slots := aNumberOfSlots.
]

{ #category : #'testing - variables' }
Board >> slotsAmount [

	^ slots.
]
