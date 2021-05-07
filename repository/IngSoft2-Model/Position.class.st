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

	^ self new initializeUsing: 0.
]

{ #category : #arithmetic }
Position >> + aNumberOfSlots [
	slot := slot + aNumberOfSlots.
	^ self
]

{ #category : #arithmetic }
Position >> < aPosition [
	^ self position < aPosition position
]

{ #category : #arithmetic }
Position >> <= aPosition [
	^ self position <= aPosition position
]

{ #category : #arithmetic }
Position >> > aPosition [
	^ self position > aPosition position
]

{ #category : #arithmetic }
Position >> addLap [
 lap := lap+1.
 slot := 0.
]

{ #category : #private }
Position >> backToStart [
	slot := 0
]

{ #category : #initialization }
Position >> initializeUsing: startingSlot [
	
	slot := startingSlot .
	lap := 0.
]

{ #category : #accessing }
Position >> lap [
	^ lap
]

{ #category : #accessing }
Position >> position [
	^ slot
]
