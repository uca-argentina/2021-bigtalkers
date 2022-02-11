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

	self getLap = aPosition getLap
		ifTrue: [ ^ self getSlot <= aPosition getSlot ]
		ifFalse: [ ^ self getLap < aPosition getLap ]
]

{ #category : #arithmetic }
Position >> > aPosition [

	^ self getSlot > aPosition getSlot
]

{ #category : #arithmetic }
Position >> >= aPosition [

	self getLap = aPosition getLap
		ifTrue: [ ^ self getSlot >= aPosition getSlot ]
		ifFalse: [ ^ self getLap > aPosition getLap ]
]

{ #category : #'accessing - position' }
Position >> getLap [

	^ lap
]

{ #category : #'accessing - position' }
Position >> getSlot [

	^ slot
]

{ #category : #initialization }
Position >> initializeUsing: aSlot andLap: aLap [

	slot := aSlot.
	lap := aLap
]
