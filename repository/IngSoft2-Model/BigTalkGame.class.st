Class {
	#name : #BigTalkGame,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice',
		'board',
		'scoreboard',
		'turn',
		'currentPlayer',
		'finishingLap'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BigTalkGame class >> playedBy: somePlayers usingDice: someDice playedOn: aBoard [

	self validateDuplicatePlayers: somePlayers.
	self validateNoPlayers: somePlayers.
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard
]

{ #category : #validation }
BigTalkGame class >> validateDuplicatePlayers: somePlayers [

	| somePlayersNames |
	somePlayersNames := Set
		withAll: (somePlayers collect: [ :player | player playerName ]).
	somePlayers size ~= somePlayersNames size
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

{ #category : #'testing - variables' }
BigTalkGame >> boardSlotsAmount [

	^ board slotsAmount
]

{ #category : #playing }
BigTalkGame >> changeTurn [

	turn nextPut: currentPlayer.
	currentPlayer := turn next
]

{ #category : #'testing - player' }
BigTalkGame >> currentTurnPlayer [

	^ currentPlayer
]

{ #category : #'testing - player' }
BigTalkGame >> currentTurnPlayerName [

	^ self currentTurnPlayer playerName
]

{ #category : #'testing - player' }
BigTalkGame >> currentTurnPlayerPosition [

	^ self positionOf: currentPlayer
]

{ #category : #'effect-application' }
BigTalkGame >> effectAt: aPosition [

	^ board effectAt: aPosition
]

{ #category : #'testing - variables' }
BigTalkGame >> hasFinished [

	^ self leaderLap >= finishingLap
]

{ #category : #initialize }
BigTalkGame >> initializeWithPlayers: somePlayers withDice: someDice withBoard: aBoard [

	finishingLap := 2.
	players := somePlayers.
	dice := someDice.
	board := aBoard.
	scoreboard := Scoreboard competingPlayers: players.
	turn := SharedQueue new.
	players do: [ :player | turn nextPut: player ].
	currentPlayer := turn next
]

{ #category : #'testing - player' }
BigTalkGame >> lapOf: aPlayer [

	^ scoreboard currentLapOf: aPlayer
]

{ #category : #'testing - leader' }
BigTalkGame >> leader [

	^ scoreboard leader key
]

{ #category : #'testing - leader' }
BigTalkGame >> leaderLap [

	^ scoreboard leaderLap
]

{ #category : #'testing - leader' }
BigTalkGame >> leaderName [

	^ scoreboard leaderName
]

{ #category : #'testing - leader' }
BigTalkGame >> leaderPosition [

	^ scoreboard leaderPosition
]

{ #category : #playing }
BigTalkGame >> moveCurrentPlayer [

	self hasFinished
		ifFalse: [ self playerMoveAfterRoll: self currentTurnPlayer.
			self applyEffectAt: self currentTurnPlayerPosition.
			self changeTurn ]
		ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer slots: aNumberOfSlots [

	| playerposition valueToMove laps newPosition |
	playerposition := scoreboard currentPositionOf: aPlayer.
	valueToMove := aNumberOfSlots.
	newPosition := valueToMove + playerposition.
	newPosition > self boardSlotsAmount
		ifTrue: [ laps := 1.
			valueToMove := newPosition - self boardSlotsAmount ]
		ifFalse: [ laps := 0 ].
	scoreboard updatePositionOf: aPlayer slots: valueToMove laps: laps.

]

{ #category : #private }
BigTalkGame >> playerMoveAfterRoll: aPlayer [

	| playerposition rollvalue laps newPosition |
	playerposition := scoreboard currentPositionOf: aPlayer.
	rollvalue := dice roll.
	newPosition := rollvalue + playerposition.
	newPosition > self boardSlotsAmount
		ifTrue: [ laps := 1.
			rollvalue := newPosition - self boardSlotsAmount ]
		ifFalse: [ laps := 0 ].
	scoreboard updatePositionOf: aPlayer slots: rollvalue laps: laps.

]

{ #category : #private }
BigTalkGame >> playerMoveToStart: aPlayer [

	scoreboard moveToStart: aPlayer
]

{ #category : #'testing - player' }
BigTalkGame >> positionOf: aPlayer [

	^ scoreboard currentPositionOf: aPlayer
]

{ #category : #'testing - player' }
BigTalkGame >> rankOf: aPlayer [

	^ scoreboard rankOf: aPlayer
]

{ #category : #'testing - player' }
BigTalkGame >> scoreOf: aPlayerName [

	^ scoreboard currentPositionOf: aPlayerName.
]
