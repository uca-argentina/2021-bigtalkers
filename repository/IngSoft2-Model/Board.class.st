Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> sized: aNumber [ 
	^self new initializeUsing: aNumber.
]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [
	self class validateMinimumSlots: aNumberOfSlots.
	slots := aNumberOfSlots 
]

{ #category : #'testing - variables' }
Board >> slotsAmount [
	^slots
]
