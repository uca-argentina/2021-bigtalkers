Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
GameTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #tests }
GameTest >> testAGameWithScoreboardGetLeaderUsingRoll [

	| aGame player1 player2 aDie aBoard aDice aLeader |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 2.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: (aLeader between: 1 and: 4)
]

{ #category : #tests }
GameTest >> testAGameWithScoreboardMovesForward [

	| aGame player1 player2 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 2.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: ((aGame scoreOf: player1) between: 1 and: 4).
	self assert: (aGame scoreOf: player2) equals: 0
]

{ #category : #tests }
GameTest >> testAGameWithTwoPlayersAndADieAndABoardHasNotFinished [

	| aGame player1 player2 aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDice := Dice with: {(Die withSides: 4)}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	self deny: aGame hasFinished
]

{ #category : #tests }
GameTest >> testCannotCreateAGameWithNoPlayers [

	| aDie aDice aBoard |
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	self
		should: [ BigTalkGame playedBy: {} usingDice: aDice playedOn: aBoard ]
		raise: Error
		withMessage: 'You need at least one player to play'
]

{ #category : #tests }
GameTest >> testCheckLeaderName [

	| aGame player1 player2 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: aGame leaderName equals: 'Gaspar'
]

{ #category : #tests }
GameTest >> testCheckPlayerPositions [

	| aGame player1 player2 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 20.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame positionOf: player2) equals: 4
]

{ #category : #tests }
GameTest >> testCheckPlayerPositionsWithATie [

	| aGame player1 player2 player3 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: (aGame rankOf: player2) equals: 2
]

{ #category : #tests }
GameTest >> testCheckPlayerTurn [

	| aGame player1 player2 player3 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	self assert: aGame currentTurnPlayerName equals: 'Gaspar'
]

{ #category : #tests }
GameTest >> testCheckPlayerTurnAfterMove [

	| aGame player1 player2 player3 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: aGame currentTurnPlayerName equals: 'Martin'
]

{ #category : #tests }
GameTest >> testCheckRankingPositions [

	| aGame player1 player2 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 5.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame rankOf: player2) equals: 2
]

{ #category : #tests }
GameTest >> testCreateAGameWithDefaultValues [

	| aGame aLeader player1 player2 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: (aLeader between: 1 and: 4)
]

{ #category : #tests }
GameTest >> testCreateAGameWithScoreboard [

	| aGame player1 player2 aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDice := Dice with: {(Die withSides: 4)}.
	aBoard := Board sized: 2.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	self assert: (aGame scoreOf: player1) equals: 0.
	self assert: (aGame scoreOf: player2) equals: 0
]

{ #category : #tests }
GameTest >> testCreateAGameWithTwoPlayersAndTwoDiceAndABoard [

	| aGame player1 player2 aDie anotherDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	anotherDie := Die withSides: 4.
	aDice := Dice
		with:
			{aDie.
			anotherDie}.
	aBoard := Board sized: 25.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	self assert: aGame boardSlotsAmount equals: 25
]

{ #category : #tests }
GameTest >> testGameControlledMovement [

	| aGame player1 player2 player3 aDie aDice aBoard |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 20.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: aGame currentTurnPlayerName equals: 'Gaspar'
]

{ #category : #tests }
GameTest >> testGameFinishedAndStillMovePlayer [

	| aGame aDie aDice aBoard player1 player2 player3 |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 5.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self
		should: [ aGame moveCurrentPlayer ]
		raise: Error
		withMessage: 'The game has finished'
]

{ #category : #tests }
GameTest >> testGameFinishedWithWinner [

	| aGame aDie aDice aBoard player1 player2 player3 |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 6.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 5.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	4 timesRepeat: [ aGame moveCurrentPlayer ].
	self assert: aGame hasFinished.
	self assert: aGame leader equals: player1
]

{ #category : #tests }
GameTest >> testGameNewLap [

	| aGame aDie aDice aBoard player1 player2 player3 |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 15.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard.
	10 timesRepeat: [ aGame moveCurrentPlayer ].
	self assert: (aGame lapOf: player1) equals: 1.
	self assert: (aGame positionOf: player1) equals: 1
]

{ #category : #tests }
GameTest >> testGamePlayerOneFallsInAtomicBomb [

	| aDie aDice aBoard player1 player2 aGame aSeedGenerator effectsUsed |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 99.
	aDice := Dice with: {aDie}.
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalk.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := FixedBoard seeding: aSeedGenerator.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: ((aBoard effectAt: 99) isKindOf: AtomicBomb).
	self assert: (aGame positionOf: player1) equals: 0.
	self assert: (aGame positionOf: player2) equals: 0
]

{ #category : #tests }
GameTest >> testGamePlayerOneFallsInMoonWalk [

	| aDie aDice aBoard player1 player2 aGame  |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedForTestingMoonWalk: 4.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 4.
	self assert: ((aBoard effectAt: 4) isKindOf: Moonwalk).
	aGame moveCurrentPlayer.
	self assert: (aGame lapOf: player1) equals: 1.
	aGame moveCurrentPlayer.
	self assert: (aGame positionOf: player1) equals: 2.
	self assert: (aGame positionOf: player2) equals: 0.
	self assert: (aGame lapOf: player1) equals: 0.
	self assert: (aGame lapOf: player2) equals: 1.

]

{ #category : #tests }
GameTest >> testGamePlayerOneFallsInMoonWalkAndWouldHaveNegativeLaps [

	| aDie aDice aBoard player1 player2 aGame effectsUsed aSeedGenerator |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 90.
	aDice := Dice with: {aDie}.
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalk.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := FixedBoard seeding: aSeedGenerator.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: ((aBoard effectAt: 98) isKindOf: Moonwalk).
	self assert: (aGame positionOf: player1) equals: 90.
	self assert: (aGame positionOf: player2) equals: 0
]

{ #category : #tests }
GameTest >> testGamePlayerOneFallsInSpeedUp [

	| aDie aDice aBoard player1 player2 aGame effectsUsed aSeedGenerator |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 70.
	aDice := Dice with: {aDie}.
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalk.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := FixedBoard seeding: aSeedGenerator.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 3.
	aGame moveCurrentPlayer.
	self assert: ((aBoard effectAt: 70) isKindOf: SpeedUp).
	self assert: (aGame positionOf: player1) equals: 74.
	self assert: (aGame positionOf: player2) equals: 0
]

{ #category : #tests }
GameTest >> testGamePlayerOneFallsInWormhole [

	| aDie aDice aBoard player1 player2 aGame effectsUsed aSeedGenerator |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 50.
	aDice := Dice with: {aDie}.
	effectsUsed := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalk.
	BoardSlot withAtomicBomb}.
	aSeedGenerator := SeedGenerator
		distributing: effectsUsed
		havingProbabilities: #(48 20 20 10 2).
	aBoard := FixedBoard seeding: aSeedGenerator.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard.
	aGame moveCurrentPlayer.
	self assert: ((aBoard effectAt: 50) isKindOf: WormHole).
	self assert: (aGame positionOf: player1) equals: 46
]

{ #category : #tests }
GameTest >> testGameWithTwoPlayersWithSameName [

	| aDie aDice aBoard player1 player2 player3 |
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sized: 4.
	self
		should: [ BigTalkGame
				playedBy:
					{player1.
					player2.
					player3}
				usingDice: aDice
				playedOn: aBoard ]
		raise: Error
		withMessage: 'There can not be two players with the same name'
]
