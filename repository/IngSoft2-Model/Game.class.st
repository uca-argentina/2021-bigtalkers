Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice',
		'board',
		'scoreboard',
		'finished',
		'turn',
		'round'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> defaultGameWithPlayers: aCollectionOfPlayers [
"Board for testing only with default values"
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: (Dice with:{Die withSides: 6.Die withSides: 6}) withBoard: (Board withSlots: 20) .
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
Game >> currentTurnPlayer [
	^players at: turn.
]

{ #category : #validation }
Game >> currentTurnPlayerName [
	^(self currentTurnPlayer )playerName.
]

{ #category : #validation }
Game >> diceAmount [
	^dice size.
]

{ #category : #validation }
Game >> hasFinished [
	^finished.
]

{ #category : #initialize }
Game >> initializeWith: aCollectionOfPlayers [
	players:= aCollectionOfPlayers.
	finished := false.
]

{ #category : #initialize }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection [ 
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	finished := false.
]

{ #category : #initialize }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection withBoard: aBoard [
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	board := aBoard.
	scoreboard := Scoreboard withPlayers: players.
	finished := false.
	turn := 1.
	round := 1.
]

{ #category : #function }
Game >> leaderName [
	^scoreboard leaderName .
]

{ #category : #function }
Game >> leaderScore [
	^scoreboard leaderScore.
]

{ #category : #function }
Game >> moveCurrentPlayer [
	(finished) ifFalse: [  self playerMove: (self currentTurnPlayer)]  ifTrue: [  Error signal: 'The game has finished'] .
	
]

{ #category : #validation }
Game >> playerMove: aPlayer [
	scoreboard updatePosition: aPlayer slots: (dice roll)..
	turn := ((turn * ((turn < (self playersAmount ) ) asBit) )+ 1).
	finished := (scoreboard leaderScore) >= (self boardSlotsAmount)  
]

{ #category : #function }
Game >> playerRank: aPlayer [ 
	^scoreboard playerRank: aPlayer.
]

{ #category : #validation }
Game >> playerScore: aPlayerName [  
	^scoreboard currentPosition: aPlayerName .
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]
