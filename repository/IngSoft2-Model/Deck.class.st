Class {
	#name : #Deck,
	#superclass : #Object,
	#instVars : [
		'cards'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Deck class >> default [
	^ self new
		initializeUsing: {
			Speed new.
			Acceleration new.
			Redo new.
			Repeat new.
			Overload new.
			Cancellation new.
			}
]

{ #category : #'instance creation' }
Deck class >> onlyAccelerationCards [
	^ self new initializeUsing: {Acceleration new}
]

{ #category : #'instance creation' }
Deck class >> onlyOverloadCards [
	^ self new initializeUsing: {Overload new}
]

{ #category : #'instance creation' }
Deck class >> onlyRedoCards [
	^ self new initializeUsing: {Redo new}
]

{ #category : #'instance creation' }
Deck class >> onlyRepeatCards [
	^ self new initializeUsing: {Repeat new}
]

{ #category : #'instance creation' }
Deck class >> onlySpeedCards [
	^ self new initializeUsing: {Speed new}
]

{ #category : #'instance creation' }
Deck class >> using: cardTypes [

	^self new initializeUsing: cardTypes
]

{ #category : #initialization }
Deck >> draw [
	| drawnCard |
	
	 drawnCard:= cards at: ((1 to: cards size) atRandom).
	^drawnCard
]

{ #category : #initialization }
Deck >> initializeUsing: cardTypes [
	cards := OrderedCollection withAll: cardTypes .

]
