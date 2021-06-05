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
	aDice := Dice with: { aDie }.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		         playedBy: { 
				         player1.
				         player2 }
		         usingDice: aDice
		         playedOn: aBoard
		         finishingAtLap: 1.
	aGame player: player2 usesCard: Speed new on: player1.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCard [

	| aGame player1 player2 aDie aBoard aDice aLeaderPosition someSlots|
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: { aDie }.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withAtomicBomb.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	aGame player: player2 usesInstantCard: Repeat new on: player1.
	aGame moveCurrentPlayer.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 5.
	
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
	self assert: (aGame currentSlotOf: player1) equals:  2.
	self assert: (aGame currentSlotOf: player2) equals:  4
]
