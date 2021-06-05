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
		'finishingLap',
		'activeCards',
		'lastCardUsed',
		'lastEffect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BigTalkGame class >> playedBy: somePlayers usingDice: someDice playedOn: aBoard finishingAtLap: aLapNumber [

	self validateDuplicatePlayers: somePlayers.
	self validateNoPlayers: somePlayers.
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard
		finishingAtLap: aLapNumber
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

{ #category : #private }
BigTalkGame >> addActiveCard: aCard [

	activeCards add: aCard.
	lastCardUsed := aCard
]

{ #category : #'effect-application' }
BigTalkGame >> applyAtomicBomb [

	players do: [ :player | self playerMoveToStart: player ]
]

{ #category : #'effect-application' }
BigTalkGame >> applyEffectAt: aPlayerPosition [

	| effect |
	effect := self effectAt: aPlayerPosition.
	effect applyTo: self.
	^effect
]

{ #category : #'effect-application' }
BigTalkGame >> applyMoonWalk: N [

	self playerMove: self currentTurnPlayer slots: N.
	players do: [ :player | self playerMove: player slots: N * -1 ]
]

{ #category : #'effect-application' }
BigTalkGame >> applySpeedUp [

	self playerMove: self currentTurnPlayer slots: 4
]

{ #category : #'effect-application' }
BigTalkGame >> applyWormHole [

	self playerMove: self currentTurnPlayer slots: -4
]

{ #category : #'accessing - variables' }
BigTalkGame >> boardSlotsAmount [

	^ board slotsAmount
]

{ #category : #playing }
BigTalkGame >> changeTurn [

	turn nextPut: currentPlayer.
	currentPlayer := turn next
]

{ #category : #'accesing - player' }
BigTalkGame >> currentLapOf: aPlayer [

	^ board currentLapOf: aPlayer
]

{ #category : #'accesing - player' }
BigTalkGame >> currentSlotOf: aPlayer [

	^ board currentSlotOf: aPlayer
]

{ #category : #'accesing - player' }
BigTalkGame >> currentTurnPlayer [

	^ currentPlayer
]

{ #category : #'accesing - player' }
BigTalkGame >> currentTurnPlayerName [

	^ self currentTurnPlayer playerName
]

{ #category : #'accesing - player' }
BigTalkGame >> currentTurnPlayerPosition [

	^ self currentSlotOf: currentPlayer
]

{ #category : #'effect-application' }
BigTalkGame >> effectAt: aPosition [

	^ board effectAt: aPosition
]

{ #category : #'accessing - variables' }
BigTalkGame >> hasFinished [

	^ self leaderLap >= finishingLap
]

{ #category : #initialize }
BigTalkGame >> initializeWithPlayers: somePlayers withDice: someDice withBoard: aBoard finishingAtLap: aLapNumber [

	finishingLap := aLapNumber.
	players := somePlayers.
	dice := someDice.
	board := aBoard.
	board addPlayers: somePlayers.
	activeCards := PermanentCardsOnPlayers forPlayers: somePlayers.
	lastEffect := NoEffect new.
	scoreboard := Scoreboard competingPlayers: somePlayers.
	scoreboard update: board playerPositions.

	turn := SharedQueue new.
	turn nextPutAll: players.
	currentPlayer := turn next
]

{ #category : #'accessing - leader' }
BigTalkGame >> leader [

	^ scoreboard leader key
]

{ #category : #'accessing - leader' }
BigTalkGame >> leaderLap [

	^ scoreboard leaderLap
]

{ #category : #'accessing - leader' }
BigTalkGame >> leaderName [

	^ scoreboard leaderName
]

{ #category : #'accessing - leader' }
BigTalkGame >> leaderPosition [

	^ scoreboard leaderPosition
]

{ #category : #playing }
BigTalkGame >> moveCurrentPlayer [
	
	
	
	self hasFinished
		ifFalse: [ 
			self playerMoveAfterRoll: self currentTurnPlayer.
			lastEffect := self applyEffectAt: self currentTurnPlayerPosition .
			self changeTurn.
			scoreboard update: board playerPositions ]
		ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : #private }
BigTalkGame >> player: aPlayer usesCard: aCard on: affected [
 affected isCollection 
		ifTrue:  [ affected do: [ :player | activeCards add: aCard to: player ] ] 
		ifFalse: [ activeCards add: aCard to: affected  ]
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer slots: aNumberOfSlots [

	board movePlayer: aPlayer to: aNumberOfSlots
]

{ #category : #private }
BigTalkGame >> playerMoveAfterRoll: aPlayer [

	|  rollvalue modifier|
	modifier := activeCards playerRollModifier: aPlayer.
	rollvalue := dice roll + modifier.
	board movePlayer: aPlayer to: rollvalue
]

{ #category : #private }
BigTalkGame >> playerMoveToStart: aPlayer [

	board moveToStart: aPlayer
]

{ #category : #'accesing - player' }
BigTalkGame >> rankOf: aPlayer [

	^ scoreboard rankOf: aPlayer
]
