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

	self validatePlayersNameCannotBeEmpty: aName.
	^ self new initializeWithName: aName
]

{ #category : #validation }
Player class >> validatePlayersNameCannotBeEmpty: aName [

	aName = ''
		ifTrue: [ Error signal: 'A player cannot have an empty name' ]
]

{ #category : #initialize }
Player >> initializeWithName: aName [

	name := aName
]

{ #category : #'accessing - name' }
Player >> playerName [

	^ name
]
