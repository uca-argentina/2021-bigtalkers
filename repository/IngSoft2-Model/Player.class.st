Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'position',
		'name',
		'scoreboard'
	],
	#classInstVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> named: aName [
	^self new initializeWithName: aName.
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	position := 0.
	name := aName.
]

{ #category : #validation }
Player >> playerName [
	^name.
]
