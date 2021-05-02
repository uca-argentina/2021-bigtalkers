Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> named: aName [

	^ self new initializeWithName: aName.
]

{ #category : #initialize }
Player >> initializeWithName: aName [

	name := aName.
]

{ #category : #validation }
Player >> playerName [

	^ name.
]
