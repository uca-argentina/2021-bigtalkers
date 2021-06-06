Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
		'cardsAffecting',
		'hand'
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

	cardsAffecting := OrderedCollection new.
	name := aName
]

{ #category : #'accessing - name' }
Player >> playerName [

	^ name
]
