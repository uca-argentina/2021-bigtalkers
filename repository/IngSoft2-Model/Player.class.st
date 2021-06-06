Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name',
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
Player >> drawCardFrom: aDeck [
	| newCard |
	newCard := aDeck draw.
	hand add: newCard
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	
	hand := OrderedCollection new.
	name := aName
]

{ #category : #'accessing - name' }
Player >> playerName [

	^ name
]

{ #category : #'private - testing' }
Player >> testingAddCard: aCard [
	hand add: aCard
]

{ #category : #initialize }
Player >> useCardFromHand: aCard [
	| index |
	index := hand indexOf: aCard ifAbsent: [ Error signal: 'The player does not have that card'  ] .
	hand removeAt: index.
	^ index >= 0
]
