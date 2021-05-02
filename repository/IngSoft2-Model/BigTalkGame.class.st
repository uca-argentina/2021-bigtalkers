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
		'currPlayer'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BigTalkGame class >> playedBy: aCollectionOfPlayers diceUsed: someDice playedOn: aBoard [ 
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: someDice withBoard: aBoard .
]

{ #category : #queries }
BigTalkGame >> boardSlotsAmount [
	^board slotsAmount.
]

{ #category : #function }
BigTalkGame >> changeTurn [
	turn nextPut: currPlayer.
	currPlayer := turn next.
]

{ #category : #queries }
BigTalkGame >> currentTurnPlayer [
	^ currPlayer.
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
	
	self validateDuplicatePlayers: aCollectionOfPlayers.
	self validateNoPlayers: aCollectionOfPlayers .
	
	
	players:= aCollectionOfPlayers.
	dice := someDice.
	board := aBoard.
	scoreboard := Scoreboard competingPlayers: players.
	finished := false.
	turn := SharedQueue new.
	players do: [ :player | turn nextPut: player].
	currPlayer := turn next.




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
	finished
		ifFalse: [ self playerMove: self currentTurnPlayer.
			self changeTurn ]
		ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer [
	scoreboard updatePosition: aPlayer slots: dice roll.
	finished := scoreboard leaderScore >= self boardSlotsAmount
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
BigTalkGame >> positionOf: aPlayer [ 
	^scoreboard currentPosition: aPlayer.
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
