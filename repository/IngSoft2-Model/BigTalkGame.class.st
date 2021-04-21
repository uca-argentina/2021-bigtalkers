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

{ #category : #validation }
BigTalkGame >> boardSlotsAmount [
	^board slotsAmount.
]

{ #category : #validation }
BigTalkGame >> currentTurnPlayer [
	^players at: turn.
]

{ #category : #validation }
BigTalkGame >> currentTurnPlayerName [
	^(self currentTurnPlayer )playerName.
]

{ #category : #validation }
BigTalkGame >> duplicatePlayers: aCollectionOfPlayers [
	|aSetOfPlayerNames aCollectionOfPlayerNames|
	aSetOfPlayerNames := Set new.
	aCollectionOfPlayerNames  := OrderedCollection new.
	
	aCollectionOfPlayers do: [ :player | aSetOfPlayerNames add: (player playerName ). aCollectionOfPlayerNames add: (player playerName ).].
	 ^((aCollectionOfPlayers size) ~= (aSetOfPlayerNames size) ).
]

{ #category : #validation }
BigTalkGame >> hasFinished [
	^finished.
]

{ #category : #initialize }
BigTalkGame >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection withBoard: aBoard [
 (self duplicatePlayers: aCollectionOfPlayers) 

ifFalse: [players:= aCollectionOfPlayers.
	dice := aDiceCollection.
	board := aBoard.
	scoreboard := Scoreboard withPlayers: players.
	finished := false.
	turn := 1.
	round := 1.]

ifTrue: [  Error signal: 'There can not be two players with the same name'] .	
]

{ #category : #function }
BigTalkGame >> leaderName [
	^scoreboard leaderName .
]

{ #category : #function }
BigTalkGame >> leaderScore [
	^scoreboard leaderScore.
]

{ #category : #function }
BigTalkGame >> moveCurrentPlayer [
	(finished) ifFalse: [  self playerMove: (self currentTurnPlayer)]  ifTrue: [  Error signal: 'The game has finished'] .
	
]

{ #category : #validation }
BigTalkGame >> playerMove: aPlayer [
	scoreboard updatePosition: aPlayer slots: (dice roll)..
	turn := ((turn * ((turn < (self playersAmount ) ) asBit) )+ 1).
	finished := (scoreboard leaderScore) >= (self boardSlotsAmount)  
]

{ #category : #function }
BigTalkGame >> playerPosition: aPlayer [ 
	^scoreboard currentPosition: (aPlayer playerName ).
]

{ #category : #function }
BigTalkGame >> playerRank: aPlayer [ 
	^scoreboard playerRank: aPlayer.
]

{ #category : #validation }
BigTalkGame >> playerScore: aPlayerName [  
	^scoreboard currentPosition: aPlayerName .
]

{ #category : #validation }
BigTalkGame >> playersAmount [
	^players size.
]
