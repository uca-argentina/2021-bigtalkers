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
		initializeWith:
			{Speed new.
			Acceleration new.
			Redo new.
			Repeat new.
			Overload new.
			Cancellation new}
]

{ #category : #'instance creation' }
Deck class >> onlyAccelerationCards [

	^ self new initializeWith: {Acceleration new}
]

{ #category : #'instance creation' }
Deck class >> onlyCancellationCards [

	^ self new initializeWith: {Cancellation new}
]

{ #category : #'instance creation' }
Deck class >> onlyOverloadCards [

	^ self new initializeWith: {Overload new}
]

{ #category : #'instance creation' }
Deck class >> onlyRedoCards [

	^ self new initializeWith: {Redo new}
]

{ #category : #'instance creation' }
Deck class >> onlyRepeatCards [

	^ self new initializeWith: {Repeat new}
]

{ #category : #'instance creation' }
Deck class >> onlySpeedCards [

	^ self new initializeWith: {Speed new}
]

{ #category : #'instance creation' }
Deck class >> using: cardTypes [

	^ self new initializeWith: cardTypes
]

{ #category : #drawing }
Deck >> draw [

	| drawnCard |
	drawnCard := cards at: (1 to: cards size) atRandom.
	^ drawnCard
]

{ #category : #initialization }
Deck >> initializeWith: cardTypes [

	cards := OrderedCollection withAll: cardTypes
]
