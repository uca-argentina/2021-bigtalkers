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

	self validateDuplicatePlayers: somePlayers.
	self validateNoPlayers: somePlayers.
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard
]

{ #category : #validation }
BigTalkGame class >> validateDuplicatePlayers: somePlayers [

	| aSetOfPlayerNames |
	aSetOfPlayerNames := Set
		withAll: (somePlayers collect: [ :player | player playerName ]).
	somePlayers size ~= aSetOfPlayerNames size
		ifTrue: [ Error signal: 'There can not be two players with the same name' ]
]

{ #category : #validation }
BigTalkGame class >> validateNoPlayers: somePlayers [

	somePlayers isEmpty
		ifTrue: [ Error signal: 'You need at least one player to play' ]
]

{ #category : #'effect-application' }
BigTalkGame >> applyAtomicBomb [

	players do: [ :player | self playerMoveToStart: player ]
]

{ #category : #'effect-application' }
BigTalkGame >> applyEffectAt: aPlayerPosition [

	| effect |
	effect := self effectAt: aPlayerPosition.
	effect applyTo: self
]

{ #category : #'effect-application' }
BigTalkGame >> applyMoonWalk: N [
	players do: [ :player | self playerMove: player slots: N * -1 ].
	self playerMove: self currentTurnPlayer slots: N
]

{ #category : #'effect-application' }
BigTalkGame >> applySpeedUp [

	self playerMove: self currentTurnPlayer slots: 4
]

{ #category : #'effect-application' }
BigTalkGame >> applyWormHole [

	self playerMove: self currentTurnPlayer slots: -4
]

{ #category : #accessing }
BigTalkGame >> boardSlotsAmount [

	^ board slotsAmount
]

{ #category : #'game-actions' }
BigTalkGame >> changeTurn [

	turn nextPut: currPlayer.
	currPlayer := turn next
]

{ #category : #accessing }
BigTalkGame >> currentTurnPlayer [

	^ currPlayer
]

{ #category : #accessing }
BigTalkGame >> currentTurnPlayerName [

	^ self currentTurnPlayer playerName
]

{ #category : #accessing }
BigTalkGame >> currentTurnPlayerPosition [

	^ self positionOf: currPlayer
]

{ #category : #accessing }
BigTalkGame >> effectAt: aPosition [

	^ board effectAt: aPosition
]

{ #category : #accessing }
BigTalkGame >> hasFinished [

	^ finished
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
	currPlayer := turn next
]

{ #category : #accessing }
BigTalkGame >> lapOf: aPlayer [

	^ scoreboard currentLap: aPlayer
]

{ #category : #accessing }
BigTalkGame >> leader [

	^ scoreboard leader key
]

{ #category : #accessing }
BigTalkGame >> leaderName [

	^ scoreboard leaderName
]

{ #category : #accessing }
BigTalkGame >> leaderScore [

	^ scoreboard leaderScore
]

{ #category : #'game-actions' }
BigTalkGame >> moveCurrentPlayer [

	finished
		ifFalse: [ self playerMoveAfterRoll: self currentTurnPlayer.
			self applyEffectAt: self currentTurnPlayerPosition.
			self changeTurn ]
		ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer slots: aNumberOfSlots [

	| playerposition valueToMove laps newPosition |
	playerposition := scoreboard currentPosition: aPlayer.
	valueToMove := aNumberOfSlots.
	newPosition := valueToMove + playerposition.
	newPosition > self boardSlotsAmount
		ifTrue: [ laps := 1.
			valueToMove := newPosition - self boardSlotsAmount ]
		ifFalse: [ laps := 0 ].
	scoreboard updatePosition: aPlayer slots: valueToMove laps: laps.
	finished := scoreboard leaderScore >= self boardSlotsAmount
]

{ #category : #private }
BigTalkGame >> playerMoveAfterRoll: aPlayer [

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

{ #category : #private }
BigTalkGame >> playerMoveToStart: aPlayer [

	scoreboard moveToStart: aPlayer.
	finished := scoreboard leaderScore >= self boardSlotsAmount
]

{ #category : #accessing }
BigTalkGame >> playerRank: aPlayer [

	^ scoreboard playerRank: aPlayer
]

{ #category : #accessing }
BigTalkGame >> playerScore: aPlayerName [

	^ scoreboard currentPosition: aPlayerName.
]

{ #category : #accessing }
BigTalkGame >> positionOf: aPlayer [

	^ scoreboard currentPosition: aPlayer
]
