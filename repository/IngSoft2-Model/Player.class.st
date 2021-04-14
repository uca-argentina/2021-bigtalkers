Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position',
		'name',
		'scoreboard'
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

{ #category : #'instance creation' }
Player class >> startWithName: aName [
	^self new initializeWithName: aName.
]

{ #category : #initialize }
Player >> initializeAtStart [
	position := 0.
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	position := 0.
	name := aName.
]

{ #category : #validation }
Player >> isAt: aPosition [ 
	^(position = aPosition).
]

{ #category : #function }
Player >> movesForward: aNumber [ 
	position := position + aNumber.
]

{ #category : #validation }
Player >> playerName [
	^name.
]

{ #category : #validation }
Player >> playerPosition [
	^position.
]
