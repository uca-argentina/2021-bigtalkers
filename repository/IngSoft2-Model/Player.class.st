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

	self validate: aName.
	^ self new initializeWith: aName
]

{ #category : #validation }
Player class >> validate: aName [

	self validatePlayersNameCannotBeEmpty: aName
]

{ #category : #validation }
Player class >> validatePlayersNameCannotBeEmpty: aName [

	aName = ''
		ifTrue: [ Error signal: 'A player cannot have an empty name' ]
]

{ #category : #'accessing - cards' }
Player >> drawCardFrom: aDeck [

	| newCard |
	newCard := aDeck draw.
	hand add: newCard
]

{ #category : #initialization }
Player >> initializeWith: aName [
	
	hand := OrderedCollection new.
	name := aName
]

{ #category : #'accessing - name' }
Player >> playerName [

	^ name
]

{ #category : #'accessing - cards' }
Player >> useCardFromHand: aCard [

	hand remove: aCard ifAbsent: [ 
		hand isEmpty
			ifTrue: [ Error signal: 'The player does not have any cards left' ]
			ifFalse: [ Error signal: 'The player does not have that card' ] ]
]
