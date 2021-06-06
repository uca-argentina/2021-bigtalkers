Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'player1',
		'player2',
		'player3'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CardTest >> setUp [
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'
]

{ #category : #asserting }
CardTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #tests }
CardTest >> testAGamePlayerPlaysCardNotInHand [
	| aGame aDie aBoard aDice |
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy: { player1 . player2 }
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	self
		should: [ aGame player: player2 usesCard: Overload on: player1 ]
		raise: Error
		withMessage: 'The player does not have that card'
]

{ #category : #tests }
CardTest >> testAGameWithASpeedCard [
	| aGame aDie aBoard aDice aLeader |
	player2 testingAddCard: Speed new.
	aDie   := LoadedDie rolling: 4.
	aDice  := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame  := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Speed new on: player1.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnAccelerationCard [
	| aGame aDie aBoard aDice allPlayers |
	player2 testingAddCard: Acceleration new.
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Acceleration new on: allPlayers.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player2) equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectAtomicBomb [

	| aGame aDie aBoard aDice aLeaderPosition someSlots |

	player2 testingAddCard: Repeat new .
	aDie := LoadedDie rolling: 8.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withAtomicBomb}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	aGame moveCurrentPlayer.
	aGame player: player2 usesCard: Repeat new on: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectMoonwalk [

	| aGame aDie aBoard aDice someSlots |
	player2 testingAddCard: Repeat new .
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	"3 timesRepeat: [aGame moveCurrentPlayer]."
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 4.
	self assert: (aGame currentSlotOf: player2) equals: 0.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 4.
	self assert: (aGame currentSlotOf: player2) equals: 4.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 8.
	self assert: (aGame currentSlotOf: player2) equals: 2.
	aGame player: player2 usesCard: Repeat new on: player1.
	self assert: (aGame currentSlotOf: player1) equals: 8.
	self assert: (aGame currentSlotOf: player2) equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectSpeedUp [
	| aGame aDie aBoard aDice aLeaderPosition someSlots |
	player2 testingAddCard: Repeat new.
	aDie := LoadedDie rolling: 3.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withAtomicBomb.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	aGame moveCurrentPlayer.
	aGame player: player2 usesCard: Repeat new on: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 11
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectWormHole [
	| aGame aDie aBoard aDice aLeaderPosition someSlots |
	player2 testingAddCard: Repeat new.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withWormHole}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	3 timesRepeat: [ aGame moveCurrentPlayer ].
	aGame player: player2 usesCard: Repeat new on: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 4.
	self assert: (aGame currentSlotOf: player1) equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnOverloadCard [
	| aGame aDie aBoard aDice |
	player2 testingAddCard: Overload new.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Overload new on: player1.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 4
]

{ #category : #tests }
CardTest >> testAGameWithDoubleRedoAnAcceleration [
	| aGame aDie aBoard aDice allPlayers |
	player2 testingAddCard: Acceleration  new .
	player1 testingAddCard: Redo new .
	player1 testingAddCard: Redo new .
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 20.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Acceleration new on: allPlayers.
	aGame player: player1 usesCard: Redo new on: allPlayers.
	aGame player: player1 usesCard: Redo new on: allPlayers.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 7.
	self assert: (aGame currentSlotOf: player2) equals: 7
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnAcceleration [
	| aGame aDie aBoard aDice allPlayers |
	player2 testingAddCard: Acceleration new.
	player1 testingAddCard: Redo new.
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 20.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Acceleration new on: allPlayers.
	aGame player: player1 usesCard: Redo new on: allPlayers.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 6.
	self assert: (aGame currentSlotOf: player2) equals: 6
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnOverload [

	| aGame aDie aBoard aDice |
	player2 testingAddCard: Overload new .
	player1 testingAddCard: Redo new .
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame player: player2 usesCard: Overload new on: player1.
	aGame player: player1 usesCard: Redo new on: player2.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 2
]
