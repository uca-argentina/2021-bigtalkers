Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position'
	],
	#classInstVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> start [
	^self new initializeAtStart.
]

{ #category : #initialization }
Player >> initializeAtStart [
	position := 0.
]

{ #category : #validate }
Player >> isAt: aPosition [ 
	^(position = aPosition).
]

{ #category : #action }
Player >> movesForward: aNumber [ 
	position := position + aNumber.
]
