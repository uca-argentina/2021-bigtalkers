Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Die class >> d10 [ 
	^self new initializeUsing: 10.
]

{ #category : #'instance creation' }
Die class >> d12 [
	^self new initializeUsing: 12.
]

{ #category : #'instance creation' }
Die class >> d20 [
	^self new initializeUsing: 20.
]

{ #category : #'instance creation' }
Die class >> d4 [
	^self new initializeUsing: 4.
]

{ #category : #'instance creation' }
Die class >> d6 [
	^self new initializeUsing: 6.
]

{ #category : #'instance creation' }
Die class >> d8 [
	^self new initializeUsing: 8.
]

{ #category : #'instance creation' }
Die class >> usingCustomSides: aNumberOfSides [ 
	^self new initializeUsing: aNumberOfSides.
]

{ #category : #initialize }
Die >> initializeUsing: aNumberOfSides [
	self validateSides: aNumberOfSides .
	sides := aNumberOfSides.
]

{ #category : #function }
Die >> roll [
	^((1 to: sides) atRandom).
]

{ #category : #validation }
Die >> validateSides: aNumberOfSides [
(aNumberOfSides < 4 ) ifTrue: [  Error signal: 'Dice have to have at least 4 sides'] .

]
