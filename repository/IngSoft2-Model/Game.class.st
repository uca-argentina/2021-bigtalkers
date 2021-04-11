Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice',
		'board',
		'finished'
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

{ #category : #validation }
Game >> hasFinished [
	^finished.
]

{ #category : #initialization }
Game >> initializeWith: aCollectionOfPlayers [
	players:= aCollectionOfPlayers.
	finished := false.
]

{ #category : #initialization }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection [ 
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	finished := false.
]

{ #category : #initalize }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection withBoard: aBoard [
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	board := aBoard.
	finished := false.
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]

{ #category : #validation }
Game >> playersAmount: aNumberOfPlayers [ 
	^(players size = aNumberOfPlayers).
]
