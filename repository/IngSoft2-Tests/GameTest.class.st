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
			[ :error | self assert: error messageText equals: expectedErrorMessage  ].
]

{ #category : #tests }
GameTest >> testAGameWithDefaultValues [
	
	| aGame aLeader player1 player2 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	aLeader :=aGame leaderScore.
	self assert: ( aLeader between:1 and: 4).

]

{ #category : #tests }
GameTest >> testAGameWithScoreboard [
	
	| aGame player1 player2 aDice aBoard|
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDice := Dice with: {(Die withSides: 4)}.
	aBoard :=Board sized: 2.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed: aDice playedOn: aBoard.
	self assert: (aGame  playerScore: 'Gaspar') equals: 0 .
	self assert: (aGame  playerScore: 'Martin') equals: 0 .

]

{ #category : #tests }
GameTest >> testAGameWithScoreboardMovesForward [
	
	| aGame player1 player2 aDie aDice aBoard|
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 2.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	self assert: ( (aGame  playerScore: 'Gaspar') between:1 and: 4).
	self assert:  (aGame  playerScore: 'Martin') equals: 0 .

]

{ #category : #tests }
GameTest >> testAGameWithScoreboardTestLeaderUsingRoll [
	
	| aGame player1 player2 aDie aBoard aDice aLeader|
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 2.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed: aDice playedOn: aBoard.
	aGame playerMove: player1.
	aLeader :=aGame leaderScore.
	self assert: ( aLeader  between: 1 and: 4).


]

{ #category : #tests }
GameTest >> testAGameWithTwoPlayersAndADieAndABoardHasNotFinished [
	
	| aGame player1 player2 aDice aBoard|
player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDice := Dice with: {(Die withSides: 4)}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed: aDice playedOn: aBoard.
	self deny: ( aGame  hasFinished ).

]

{ #category : #tests }
GameTest >> testCheckLeaderName [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	self assert: aGame leaderName equals: 'Gaspar'.

]

{ #category : #tests }
GameTest >> testCheckPlayerPositions [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := LoadedDie withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 20.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame playerPosition: player2 ) equals: 4.

]

{ #category : #tests }
GameTest >> testCheckPlayerPositionsWithATie [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2.player3} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	self assert:(aGame playerRank: player2 ) equals: 2.
	self assert:(aGame playerRank: player3 ) equals: 2.

]

{ #category : #tests }
GameTest >> testCheckPlayerTurn [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2.player3} diceUsed:aDice playedOn: aBoard.
	self assert:(aGame currentTurnPlayerName ) equals: 'Gaspar'.
	

]

{ #category : #tests }
GameTest >> testCheckPlayerTurnAfterMove [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2.player3} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	self assert: (aGame currentTurnPlayerName ) equals: 'Martin'.
	

]

{ #category : #tests }
GameTest >> testCheckRankingPositions [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	aGame playerMove: player1.
	self assert: (aGame playerRank: player2 ) equals: 2.

]

{ #category : #tests }
GameTest >> testCreateAGameWithTwoPlayersAndTwoDiceAndABoard [
	"prueba con dos dados"
	| aGame player1 player2 aDie anotherDie aDice aBoard|
player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	aDie := Die withSides: 4.
	anotherDie := Die withSides: 4. 
	aDice := Dice with:{aDie.anotherDie}.
	aBoard := Board sized: 25.
	aGame := BigTalkGame playedBy:  {player1.player2} diceUsed:aDice playedOn: aBoard.
	self assert: aGame  boardSlotsAmount equals: 25.
]

{ #category : #tests }
GameTest >> testGameControlledMovement [	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board sized: 20.
	aGame := BigTalkGame playedBy:  {player1.player2.player3} diceUsed:aDice playedOn: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentTurnPlayerName ) equals: 'Gaspar'.
	

]

{ #category : #tests }
GameTest >> testGameFinishedAndStillMovePlayer [
	| aGame aDie aDice aBoard player1 player2 player3|
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.
	aBoard :=Board sized: 4.
	aGame := BigTalkGame playedBy:  {player1.player2.player3 } diceUsed: aDice playedOn: aBoard.
	aGame moveCurrentPlayer.
	self should: [ aGame moveCurrentPlayer. ] 
	raise: Error  
	withMessage: 'The game has finished'.
	

]

{ #category : #tests }
GameTest >> testGameWithNoPlayers [
	| aDie aDice aBoard |
	
	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.
	aBoard :=Board sized: 4.
	
	self should: [ BigTalkGame playedBy:  {} diceUsed: aDice playedOn: aBoard ] 
	raise: Error  
	withMessage: 'You need at least one player to play'.
	

]

{ #category : #tests }
GameTest >> testGameWithTwoPlayersWithSameName [
	| aDie aDice aBoard player1 player2 player3|
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	player3 := Player named: 'Carla'.
	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.
	aBoard :=Board sized: 4.
	
	self should: [ BigTalkGame playedBy:  {player1.player2.player3 } diceUsed: aDice playedOn: aBoard ] 
	raise: Error  
	withMessage: 'There can not be two players with the same name'.
	

]

{ #category : #tests }
GameTest >> testGameWithWrongBoardClass [
	| aDie aDice player1 player2 |
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.

	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.

	
	self should: [ BigTalkGame playedBy:  {player1.player2 } diceUsed: aDice playedOn: false ] 
	raise: Error  
	withMessage: 'Board should be instance of class Board'.
	

]

{ #category : #tests }
GameTest >> testGameWithWrongDiceClass [
	| aDie aBoard player1 player2|
	
	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Carla'.
	aDie := LoadedDie withSides: 4.
	aBoard :=Board sized: 4.
	
	self should: [ BigTalkGame playedBy:{player1.player2} diceUsed: aDie playedOn: aBoard ] 
	raise: Error  
	withMessage: 'Dice should be instances of class Dice'.
	

]

{ #category : #tests }
GameTest >> testGameWithWrongPlayerClass [
	| aDie aDice aBoard |
	
	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.
	aBoard :=Board sized: 4.
	
	self should: [ BigTalkGame playedBy:  {'Pepito'.'Charlie'} diceUsed: aDice playedOn: aBoard ] 
	raise: Error  
	withMessage: 'Players should be instances of class Player'.
	

]
