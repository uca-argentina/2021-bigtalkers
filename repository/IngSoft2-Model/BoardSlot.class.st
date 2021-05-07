Class {
	#name : #BoardSlot,
	#superclass : #Object,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BoardSlot class >> withEffect: anEffect [
	self new initializeWith: anEffect.
]

{ #category : #'instance creation' }
BoardSlot class >> withNoEffect [
	^ self new initializeWith: NoEffect new
]

{ #category : #'instance creation' }
BoardSlot class >> withSpeedUp [
	^ self new initializeWith: SpeedUp new.
]

{ #category : #'instance creation' }
BoardSlot class >> withWormHole [
	^ self new initializeWith: WormHole new
]

{ #category : #'as yet unclassified' }
BoardSlot >> getEffect [
	^ effect
]

{ #category : #queries }
BoardSlot >> getEffectName [
	^ effect name.
]

{ #category : #initialization }
BoardSlot >> initializeWith: anEffect [
	effect := anEffect
]

{ #category : #queries }
BoardSlot >> name [
	^ effect name.
]
