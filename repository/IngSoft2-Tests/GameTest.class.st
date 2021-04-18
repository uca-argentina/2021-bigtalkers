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
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	aLeader :=aGame leaderScore.
	self assert: ( aLeader between:1 and: 4).

]

{ #category : #tests }
GameTest >> testAGameWithScoreboard [
	
	| aGame player1 player2 aDie aBoard|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aBoard :=Board withSlots: 2.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice: {aDie} withBoard: aBoard.
	self assert: (aGame  playerScore: 'Gaspar') equals: 0 .
	self assert: (aGame  playerScore: 'Martin') equals: 0 .

]

{ #category : #tests }
GameTest >> testAGameWithScoreboardMovesForward [
	
	| aGame player1 player2 aDie aDice aBoard|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 2.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert: ( (aGame  playerScore: 'Gaspar') between:1 and: 4).
	self assert:  (aGame  playerScore: 'Martin') equals: 0 .

]

{ #category : #tests }
GameTest >> testAGameWithScoreboardTestLeaderUsingRoll [
	
	| aGame player1 player2 aDie aBoard aDice aLeader|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 2.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice: aDice withBoard: aBoard.
	aGame playerMove: player1.
	aLeader :=aGame leaderScore.
	self assert: ( aLeader  between: 1 and: 4).


]

{ #category : #tests }
GameTest >> testAGameWithTwoPlayersAndADieAndABoardHasNotFinished [
	
	| aGame player1 player2 aDie aBoard|
player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice: {aDie} withBoard: aBoard.
	self deny: ( aGame  hasFinished ).

]

{ #category : #tests }
GameTest >> testCheckLeaderName [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert: aGame leaderName equals: 'Gaspar'.

]

{ #category : #tests }
GameTest >> testCheckPlayerPositions [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := LoadedDie withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 20.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame playerPosition: player2 ) equals: 4.

]

{ #category : #tests }
GameTest >> testCheckPlayerPositionsWithATie [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	player3 := Player startWithName: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2.player3} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert:(aGame playerRank: player2 ) equals: 2.
	self assert:(aGame playerRank: player3 ) equals: 2.

]

{ #category : #tests }
GameTest >> testCheckPlayerTurn [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	player3 := Player startWithName: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2.player3} withDice:aDice withBoard: aBoard.
	self assert:(aGame currentTurnPlayerName ) equals: 'Gaspar'.
	

]

{ #category : #tests }
GameTest >> testCheckPlayerTurnAfterMove [
	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	player3 := Player startWithName: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2.player3} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert: (aGame currentTurnPlayerName ) equals: 'Martin'.
	

]

{ #category : #tests }
GameTest >> testCheckRankingPositions [
	
	| aGame player1 player2 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert: (aGame playerRank: player2 ) equals: 2.

]

{ #category : #tests }
GameTest >> testCreateAGameWithTwoPlayersAndTwoDiceAndABoard [
	"prueba con dos dados"
	| aGame player1 player2 aDie anotherDie aBoard|
player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 4.
	anotherDie := Die withSides: 4. 
	aBoard := Board withSlots: 25.
	aGame := BigTalkGame withPlayers:  {player1.player2} withDice:{aDie.anotherDie} withBoard: aBoard.
	self assert: aGame  boardSlotsAmount equals: 25.
]

{ #category : #tests }
GameTest >> testGameControlledMovement [	
	| aGame player1 player2 player3 aDie aDice aBoard |
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	player3 := Player startWithName: 'Carla'.
	aDie := Die withSides: 4.
	aDice := Dice with:{aDie}.
	aBoard :=Board withSlots: 20.
	aGame := BigTalkGame withPlayers:  {player1.player2.player3} withDice:aDice withBoard: aBoard.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentTurnPlayerName ) equals: 'Gaspar'.
	

]

{ #category : #tests }
GameTest >> testGameFinishedAndStillMovePlayer [
	| aGame aDie aDice aBoard player1 player2 player3|
	
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	player3 := Player startWithName: 'Carla'.
	aDie := LoadedDie withSides: 4.
	aDice := Dice with: { aDie }.
	aBoard :=Board withSlots: 4.
	aGame := BigTalkGame withPlayers:  {player1.player2.player3 } withDice: aDice withBoard: aBoard.
	aGame moveCurrentPlayer.
	self should: [ aGame moveCurrentPlayer. ] 
	raise: Error  
	withMessage: 'The game has finished'.
	

]
