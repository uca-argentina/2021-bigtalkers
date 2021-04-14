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
Board class >> withSlots: aNumber [ 
	^self new initializeUsing: aNumber.
]

{ #category : #initialize }
Board >> initializeUsing: aNumberOfSlots [
	slots := aNumberOfSlots 
]

{ #category : #validation }
Board >> slotsAmount [
	^slots.
]
