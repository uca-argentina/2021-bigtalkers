Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'sides',
		'slots'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> sized: aNumber [ 
	^self new initializeUsing: aNumber.
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [
	self validateMinimumSlots: aNumberOfSlots.
	slots := aNumberOfSlots 
]

{ #category : #validation }
Board >> slotsAmount [
	^slots
]

{ #category : #validation }
Board >> validateMinimumSlots: aNumberOfSlots [
	(aNumberOfSlots > 0) ifFalse: [ Error signal: 'Boards need at least one slot'  ]
]
