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

	^ self new initializeUsing: aNumberOfSides.
]

{ #category : #initialize }
Die >> initializeUsing: aNumberOfSides [

	self validateSides: aNumberOfSides.
	sides := aNumberOfSides.
]

{ #category : #function }
Die >> roll [

	^ (1 to: sides) atRandom.
]

{ #category : #initialize }
Die >> validateSides: aNumberOfSides [

	aNumberOfSides < 4
		ifTrue: [ Error signal: 'Dice have to have at least 4 sides' ].
]
