Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Die class >> validateSides: aNumberOfSides [

	aNumberOfSides < 4
		ifTrue: [ Error signal: 'Dice have to have at least 4 sides' ]
]

{ #category : #'instance creation' }
Die class >> withSides: aNumberOfSides [

	self validateSides: aNumberOfSides.
	^ self new initializeWith: aNumberOfSides
]

{ #category : #initialization }
Die >> initializeWith: aNumberOfSides [

	sides := aNumberOfSides
]

{ #category : #rolling }
Die >> roll [

	^ (1 to: sides) atRandom
]
