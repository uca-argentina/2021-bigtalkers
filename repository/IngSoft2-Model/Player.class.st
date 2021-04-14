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

{ #category : #initialization }
Player >> initializeAtStart [
	position := 0.
]

{ #category : #initialization }
Player >> initializeWithName: aName [
	position := 0.
	name := aName.
]

{ #category : #validate }
Player >> isAt: aPosition [ 
	^(position = aPosition).
]

{ #category : #action }
Player >> movesForward: aNumber [ 
	position := position + aNumber.
]

{ #category : #validate }
Player >> playerName [
^name
]

{ #category : #validate }
Player >> playerPosition [
^position
]
