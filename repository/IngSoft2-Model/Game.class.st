Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice',
		'board'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers [
	^self new initializeWith: aCollectionOfPlayers .
]

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers withDice: aCollectionOfDice [ 
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: aCollectionOfDice.
]

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers withDice: aCollectionOfDice withBoard: aBoard [ 
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: aCollectionOfDice withBoard: aBoard .
]

{ #category : #validation }
Game >> boardSlotsAmount [
	^board slotsAmount.
]

{ #category : #validation }
Game >> diceAmount [
	^dice size.
]

{ #category : #initialization }
Game >> initializeWith: aCollectionOfPlayers [
	players:= aCollectionOfPlayers.
]

{ #category : #initialization }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection [ 
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
]

{ #category : #initalize }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection withBoard: aBoard [
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	board := aBoard.
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]

{ #category : #validation }
Game >> playersAmount: aNumberOfPlayers [ 
	^(players size = aNumberOfPlayers).
]
