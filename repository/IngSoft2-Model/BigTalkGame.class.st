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
BigTalkGame class >> playedBy: somePlayers diceUsed: someDice playedOn: aBoard [
	
	self validateDuplicatePlayers: somePlayers .
	self validateNoPlayers: somePlayers.
	
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard.
]

{ #category : #validation }
BigTalkGame class >> validateDuplicatePlayers: somePlayers [

	| aSetOfPlayerNames |
	aSetOfPlayerNames := Set
		withAll: (somePlayers collect: [ :player | player playerName ]).
	somePlayers size ~= aSetOfPlayerNames size
		ifTrue: [ Error signal: 'There can not be two players with the same name' ].
]

{ #category : #validation }
BigTalkGame class >> validateNoPlayers: somePlayers [

	somePlayers isEmpty
		ifTrue: [ Error signal: 'You need at least one player to play' ].
]

{ #category : #queries }
BigTalkGame >> boardSlotsAmount [

	^ board slotsAmount.
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

	^ self currentTurnPlayer playerName.
]

{ #category : #queries }
BigTalkGame >> hasFinished [

	^ finished.
]

{ #category : #initialize }
BigTalkGame >> initializeWithPlayers: somePlayers withDice: someDice withBoard: aBoard [


	players := somePlayers.
	dice := someDice.
	board := aBoard.
	scoreboard := Scoreboard competingPlayers: players.
	finished := false.
	turn := SharedQueue new.
	players do: [ :player | turn nextPut: player ].
	currPlayer := turn next.
]

{ #category : #queries }
BigTalkGame >> lapOf: aPlayer [

	^ scoreboard currentLap: aPlayer.
]

{ #category : #queries }
BigTalkGame >> leader [

	^ scoreboard leader key.
]

{ #category : #queries }
BigTalkGame >> leaderName [

	^ scoreboard leaderName.
]

{ #category : #queries }
BigTalkGame >> leaderScore [

	^ scoreboard leaderScore.
]

{ #category : #function }
BigTalkGame >> moveCurrentPlayer [

	finished
		ifFalse: [ self playerMove: self currentTurnPlayer.
			self changeTurn ]
		ifTrue: [ Error signal: 'The game has finished' ].
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer [
	| playerposition rollvalue laps newPosition |
	playerposition := scoreboard currentPosition: aPlayer.
	rollvalue := dice roll.
	newPosition := rollvalue + playerposition.
	newPosition > self boardSlotsAmount
		ifTrue: [ laps := 1.
			rollvalue := newPosition - self boardSlotsAmount ]
		ifFalse: [ laps := 0 ].
	scoreboard updatePosition: aPlayer slots: rollvalue laps: laps.
	finished := scoreboard leaderScore >= self boardSlotsAmount
]

{ #category : #queries }
BigTalkGame >> playerRank: aPlayer [

	^ scoreboard playerRank: aPlayer.
]

{ #category : #queries }
BigTalkGame >> playerScore: aPlayerName [

	^ scoreboard currentPosition: aPlayerName.
]

{ #category : #queries }
BigTalkGame >> positionOf: aPlayer [

	^ scoreboard currentPosition: aPlayer.
]
