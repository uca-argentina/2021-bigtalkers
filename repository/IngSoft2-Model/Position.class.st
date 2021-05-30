Class {
	#name : #Position,
	#superclass : #Object,
	#instVars : [
		'slot',
		'lap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Position class >> startingPosition [

	^ self new initializeUsing: 0
]

{ #category : #arithmetic }
Position >> + aNumberOfSlots [

	slot := slot + aNumberOfSlots.

]

{ #category : #arithmetic }
Position >> <= aPosition [

	self currentLap = aPosition currentLap
		ifTrue: [ ^ self currentSlot <= aPosition currentSlot ]
		ifFalse: [ ^ self currentLap < aPosition currentLap ]
]

{ #category : #arithmetic }
Position >> > aPosition [

	^ self currentSlot > aPosition currentSlot
]

{ #category : #arithmetic }
Position >> >= aPosition [

	self currentLap = aPosition currentLap
		ifTrue: [ ^ self currentSlot >= aPosition currentSlot ]
		ifFalse: [ ^ self currentLap > aPosition currentLap ]
]

{ #category : #arithmetic }
Position >> addLaps: aNumberOfLaps [

	aNumberOfLaps = 0
		ifTrue: [ ^ self ].
	lap := lap + aNumberOfLaps.
	slot := 0
]

{ #category : #private }
Position >> backToStart [

	slot := 0
]

{ #category : #'accessing - position' }
Position >> currentLap [

	^ lap
]

{ #category : #'accessing - position' }
Position >> currentSlot [

	^ slot
]

{ #category : #initialization }
Position >> initializeUsing: startingSlot [

	slot := startingSlot.
	lap := 0
]

{ #category : #private }
Position >> reset [

	lap := 0.
	slot := 0
]
