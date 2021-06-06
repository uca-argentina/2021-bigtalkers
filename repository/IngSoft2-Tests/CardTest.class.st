Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
CardTest >> testAGameWithASpeedCard [

	| aGame player1 player2 aDie aBoard aDice aLeader |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aGame player: player2 usesCard: Speed new on: player1.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnAccelerationCard [

	| aGame player1 player2 aDie aBoard aDice aLeader |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aGame player: player2 usesCard: Speed new on: player1.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectAtomicBomb [

	| aGame player1 player2 aDie aBoard aDice aLeaderPosition someSlots player3 |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
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

	| aGame player1 player2 aDie aBoard aDice someSlots |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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

	| aGame player1 player2 aDie aBoard aDice aLeaderPosition someSlots |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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

	| aGame player1 player2 aDie aBoard aDice aLeaderPosition someSlots |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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

	| aGame player1 player2 aDie aBoard aDice aLeader |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aLeader := aGame leaderPosition.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 4
]

{ #category : #tests }
CardTest >> testAGameWithDoubleRedoAnAcceleration [
	| aGame player1 player2 aDie aBoard aDice aLeader allPlayers |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aLeader := aGame leaderPosition.
	self assert: (aGame currentSlotOf: player1) equals: 7.
	self assert: (aGame currentSlotOf: player2) equals: 7
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnAcceleration [
	| aGame player1 player2 aDie aBoard aDice aLeader allPlayers |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aLeader := aGame leaderPosition.
	self assert: (aGame currentSlotOf: player1) equals: 6.
	self assert: (aGame currentSlotOf: player2) equals: 6
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnOverload [

	| aGame player1 player2 aDie aBoard aDice aLeader |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
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
	aLeader := aGame leaderPosition.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 2
]
