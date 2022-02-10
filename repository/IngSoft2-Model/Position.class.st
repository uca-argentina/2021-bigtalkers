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
Position class >> atSlot: slot andLap: lap [

	^ self new initializeUsing: slot andLap: lap
]

{ #category : #'instance creation' }
Position class >> startingPosition [

	^ self new initializeUsing: 0 andLap: 0
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

{ #category : #'accessing - position' }
Position >> currentLap [

	^ lap
]

{ #category : #'accessing - position' }
Position >> currentSlot [

	^ slot
]

{ #category : #initialization }
Position >> initializeUsing: aSlot andLap: aLap [

	slot := aSlot.
	lap := aLap
]
