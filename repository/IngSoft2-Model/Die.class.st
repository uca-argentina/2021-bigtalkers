Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> withSides: aNumberOfSides [ 
	^self new initializeUsing: aNumberOfSides.
]

{ #category : #initialize }
Die >> initializeUsing: aNumberOfSides [
	sides := aNumberOfSides 
]

{ #category : #function }
Die >> roll [
	^((1 to: sides) atRandom).
]
