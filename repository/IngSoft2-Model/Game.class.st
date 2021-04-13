Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice',
		'board',
		'scoreboard',
		'finished'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> testDefaultGame [
"Board for testing only with default values"
	^self new initializeWithPlayers: {Player startWithName: 'Gaspar'.Player startWithName: 'Martin'} withDice: (Dice from:{Die withSides: 6.Die withSides: 6}) withBoard: (Board withSlots: 20) .
]

{ #category : #'instance creation' }
Game class >> testDefaultGameWithPlayers: aCollectionOfPlayers [
"Board for testing only with default values"
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: (Dice from:{Die withSides: 6.Die withSides: 6}) withBoard: (Board withSlots: 20) .
]

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
	scoreboard := Scoreboard withPlayers: players.
	finished := false.
]

{ #category : #action }
Game >> leader [
scoreboard updatePositions: players.
	^scoreboard leader.
]

{ #category : #validation }
Game >> playerMove: aPlayer [
	aPlayer movesForward: (dice roll).
	scoreboard updatePositions: players.
	finished := (scoreboard leader) >= (self boardSlotsAmount)  
]

{ #category : #validation }
Game >> playerScore: aPlayerName [  
	^scoreboard currentPosition: aPlayerName .
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]

{ #category : #validation }
Game >> playersAmount: aNumberOfPlayers [ 
	^(players size = aNumberOfPlayers).
]
