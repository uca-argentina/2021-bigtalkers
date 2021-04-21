Class {
	#name : #BigTalkGame,
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
BigTalkGame class >> withPlayers: aCollectionOfPlayers withDice: aCollectionOfDice withBoard: aBoard [ 
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: aCollectionOfDice withBoard: aBoard .
]

{ #category : #queries }
BigTalkGame >> boardSlotsAmount [
	^board slotsAmount.
]

{ #category : #queries }
BigTalkGame >> currentTurnPlayer [
	^players at: turn.
]

{ #category : #queries }
BigTalkGame >> currentTurnPlayerName [
	^(self currentTurnPlayer )playerName.
]

{ #category : #queries }
BigTalkGame >> hasFinished [
	^finished.
]

{ #category : #initialize }
BigTalkGame >> initializeWithPlayers: aCollectionOfPlayers withDice: someDice withBoard: aBoard [
 	
	self validateCollectionOfPlayersClass: aCollectionOfPlayers.
	self validateBoardClass: aBoard.
	self validateDiceClass: someDice.
	
	self validateDuplicatePlayers: aCollectionOfPlayers.
	self validateNoPlayers: aCollectionOfPlayers .
	
	
	players:= aCollectionOfPlayers.
	dice := someDice.
	board := aBoard.
	scoreboard := Scoreboard withPlayers: players.
	finished := false.
	turn := 1.
	round := 1.



]

{ #category : #queries }
BigTalkGame >> leaderName [
	^scoreboard leaderName .
]

{ #category : #queries }
BigTalkGame >> leaderScore [
	^scoreboard leaderScore.
]

{ #category : #function }
BigTalkGame >> moveCurrentPlayer [
	(finished) ifFalse: [  self playerMove: (self currentTurnPlayer)]  ifTrue: [  Error signal: 'The game has finished'] .
	
]

{ #category : #function }
BigTalkGame >> playerMove: aPlayer [
	scoreboard updatePosition: aPlayer slots: (dice roll)..
	turn := ((turn * ((turn < (self playersAmount ) ) asBit) )+ 1).
	finished := (scoreboard leaderScore) >= (self boardSlotsAmount)  
]

{ #category : #queries }
BigTalkGame >> playerPosition: aPlayer [ 
	^scoreboard currentPosition: (aPlayer playerName ).
]

{ #category : #queries }
BigTalkGame >> playerRank: aPlayer [ 
	^scoreboard playerRank: aPlayer.
]

{ #category : #queries }
BigTalkGame >> playerScore: aPlayerName [  
	^scoreboard currentPosition: aPlayerName .
]

{ #category : #queries }
BigTalkGame >> playersAmount [
	^players size.
]

{ #category : #validation }
BigTalkGame >> validateBoardClass: aBoard [
	(aBoard isKindOf: Board) ifFalse: [Error signal: 'Board should be instance of class Board'] 
]

{ #category : #validation }
BigTalkGame >> validateCollectionOfPlayersClass: aCollectionOfPlayers [
	aCollectionOfPlayers do: [ :player | (player isKindOf: Player) ifFalse: [Error signal: 'Players should be instances of class Player'] ] 
]

{ #category : #validation }
BigTalkGame >> validateDiceClass: aDice [
	(aDice isKindOf: Dice) ifFalse: [Error signal: 'Dice should be instances of class Dice'] 
]

{ #category : #validation }
BigTalkGame >> validateDuplicatePlayers: aCollectionOfPlayers [
	|aSetOfPlayerNames |

	
	aSetOfPlayerNames := Set withAll: (aCollectionOfPlayers collect: [:player | player playerName ]) .
	
	((aCollectionOfPlayers size) ~= (aSetOfPlayerNames size) ) ifTrue:[Error signal: 'There can not be two players with the same name']
]

{ #category : #validation }
BigTalkGame >> validateNoPlayers: aCollectionOfPlayers [
	((aCollectionOfPlayers isEmpty) ) ifTrue:[Error signal: 'You need at least one player to play']
]
