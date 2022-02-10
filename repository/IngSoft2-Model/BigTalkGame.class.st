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
		'lastEffect',
		'deck'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
BigTalkGame class >> playedBy: somePlayers usingDice: someDice playedOn: aBoard finishingAtLap: aLapNumber [

	self validate: somePlayers.
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard
		finishingAtLap: aLapNumber
		withDeck: Deck onlyOverloadCards
]

{ #category : #'instance creation' }
BigTalkGame class >> playedBy: somePlayers usingDice: someDice playedOn: aBoard finishingAtLap: aLapNumber usingDeck: aDeck [

	self validate: somePlayers.
	^ self new
		initializeWithPlayers: somePlayers
		withDice: someDice
		withBoard: aBoard
		finishingAtLap: aLapNumber
		withDeck: aDeck
]

{ #category : #validation }
BigTalkGame class >> validate: somePlayers [

	self validateNoPlayers: somePlayers.
	self validateDuplicatePlayers: somePlayers
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

{ #category : #'accessing - game' }
BigTalkGame >> activeCardStack [

	^ activeCards 
]

{ #category : #private }
BigTalkGame >> addActiveCard: aCard on: affected [

	affected isCollection
		ifTrue: [ affected do: [ :player | activeCards add: aCard to: player ] ]
		ifFalse: [ activeCards add: aCard to: affected ]
]

{ #category : #'effect-application' }
BigTalkGame >> applyAtomicBombTo: aPlayer [

	players do: [ :player | self playerMoveToStart: player ]
]

{ #category : #'effect-application' }
BigTalkGame >> applyEffectAt: aPlayerPosition [

	| effect |
	effect := self effectAt: aPlayerPosition.
	effect applyTo: self toPlayer: self currentTurnPlayer.
	^ effect
]

{ #category : #'effect-application' }
BigTalkGame >> applyLastCardTo: affected [

	lastCardUsed applyOn: self to: affected
]

{ #category : #'effect-application' }
BigTalkGame >> applyLastEffectTo: affected [

	lastEffect applyTo: self toPlayer: affected
]

{ #category : #'effect-application' }
BigTalkGame >> applyMoonWalk: N toPlayer: affected [

	self playerMove: affected slots: N.
	players do: [ :player | self playerMove: player slots: N * -1 ]
]

{ #category : #'effect-application' }
BigTalkGame >> applySpeedUpTo: aPlayer [

	self playerMove: aPlayer slots: 4
]

{ #category : #'effect-application' }
BigTalkGame >> applyWormHoleTo: aPlayer [

	self playerMove: aPlayer slots: -4
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
BigTalkGame >> currentTurnPlayerPosition [

	^ self currentSlotOf: currentPlayer
]

{ #category : #playing }
BigTalkGame >> drawFromDeck: aPlayer [

	aPlayer drawCardFrom: deck
]

{ #category : #'effect-application' }
BigTalkGame >> effectAt: aPosition [

	^ board effectAt: aPosition
]

{ #category : #'accessing - finishing' }
BigTalkGame >> hasFinished [

	^ self leaderLap >= finishingLap
]

{ #category : #initialization }
BigTalkGame >> initializeWithPlayers: somePlayers withDice: someDice withBoard: aBoard finishingAtLap: aLapNumber withDeck: aDeck [

	finishingLap := aLapNumber.
	players := somePlayers.
	dice := someDice.
	board := aBoard.
	board addPlayers: somePlayers.
	deck := aDeck.
	self playersDrawStartingCards.
	activeCards := ActiveCardController forPlayers: somePlayers.
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
BigTalkGame >> leaderPosition [

	^ scoreboard leaderPosition
]

{ #category : #playing }
BigTalkGame >> moveCurrentPlayer [

	self hasFinished
		ifFalse: [ self playerMoveAfterRoll: self currentTurnPlayer.
			lastEffect := self applyEffectAt: self currentTurnPlayerPosition.
			self changeTurn.
			scoreboard update: board playerPositions ]
		ifTrue: [ Error signal: 'The game has finished' ]
]

{ #category : #playing }
BigTalkGame >> player: aPlayer usesCard: aCard on: target [

	self validatePlayabilityOn: aCard by: aPlayer affecting: target.
	aPlayer useCardFromHand: aCard.
	aCard applyOn: self to: target.
	aCard = Redo new
		ifFalse: [ lastCardUsed := aCard ]
]

{ #category : #private }
BigTalkGame >> playerMove: aPlayer slots: aNumberOfSlots [

	board movePlayer: aPlayer to: aNumberOfSlots
]

{ #category : #private }
BigTalkGame >> playerMoveAfterRoll: aPlayer [

	| rollvalue modifier |
	modifier := activeCards playerRollModifier: aPlayer.
	rollvalue := dice roll + modifier.
	board movePlayer: aPlayer to: rollvalue
]

{ #category : #private }
BigTalkGame >> playerMoveToStart: aPlayer [

	board moveToStart: aPlayer
]

{ #category : #private }
BigTalkGame >> playersDrawStartingCards [

	players
		do: [ :player | 
			player drawCardFrom: deck.
			player drawCardFrom: deck ]
]

{ #category : #'accesing - player' }
BigTalkGame >> rankOf: aPlayer [

	^ scoreboard rankOf: aPlayer
]

{ #category : #'effect-application' }
BigTalkGame >> removeActiveCard: aCard from: affected [

	activeCards remove: aCard from: affected
]

{ #category : #'private - validations' }
BigTalkGame >> validatePlayabilityOn: aCard by: aPlayer [

	aCard playableBy: aPlayer on: self 
]

{ #category : #'private - validations' }
BigTalkGame >> validatePlayabilityOn: aCard by: aPlayer affecting: affected [

	aCard playableBy: aPlayer on: self affecting: affected 
]
