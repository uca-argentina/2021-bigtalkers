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

	^ self new initializeWith: (Moonwalk withFixedValue: 2)
]

{ #category : #'instance creation' }
BoardSlot class >> withMoonwalkWithFixedValue [

	^ self new initializeWith: (Moonwalk withFixedValue: 2)
]

{ #category : #'instance creation' }
BoardSlot class >> withMoonwalkWithRandomValue [

	^ self new initializeWith: (Moonwalk withMaxValue: 5)
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

{ #category : #'accessing - effect' }
BoardSlot >> getN [
 
	(effect isKindOf: Moonwalk)
		ifTrue: [ ^ effect getN ]
]

{ #category : #initialization }
BoardSlot >> initializeWith: anEffect [

	effect := anEffect
]
