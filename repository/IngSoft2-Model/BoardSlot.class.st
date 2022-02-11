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
BoardSlot class >> withGrabCard [

	^ self new initializeWith: GrabCard new
]

{ #category : #'instance creation' }
BoardSlot class >> withMoonwalkWithFixedValue [

	^ self new initializeWith: (Moonwalk withStepsBack: 2)
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

{ #category : #'accessing - effect' }
BoardSlot >> effect [

	^ effect
]

{ #category : #initialization }
BoardSlot >> initializeWith: anEffect [

	effect := anEffect
]
