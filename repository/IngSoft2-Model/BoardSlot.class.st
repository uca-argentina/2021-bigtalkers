Class {
	#name : #BoardSlot,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardSlot class >> withAtomicBomb [

	^ self new initializeWith: AtomicBomb new
]

{ #category : #'instance creation' }
BoardSlot class >> withMoonwalk [

	^ self new initializeWith: Moonwalk new
]

{ #category : #'instance creation' }
BoardSlot class >> withNoEffect [

	^ self new initializeWith: NoEffect new
]

{ #category : #'instance creation' }
BoardSlot class >> withSpeedUp [

	^ self new initializeWith: SpeedUp new
]

{ #category : #'instance creation' }
BoardSlot class >> withWormHole [

	^ self new initializeWith: WormHole new
]

{ #category : #'testing - effect' }
BoardSlot >> getEffect [

	^ effect
]

{ #category : #initialization }
BoardSlot >> initializeWith: anEffect [

	effect := anEffect
]
