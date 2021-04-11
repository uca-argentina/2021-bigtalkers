Class {
	#name : #GameTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
GameTest >> test01CreateAGameWithTwoPlayers [
	
	| aGame player1 player2 |
	player1 := Player start.
	player2 := Player start.
	aGame := Game withPlayers:  {player1.player2}.
	self assert: ( aGame  playersAmount =2).
]

{ #category : #tests }
GameTest >> test02CreateAGameWithTwoPlayersAndOneDie [
	
	"prueba con 1 dado"
	| aGame player1 player2 aDie |
	player1 := Player start.
	player2 := Player start.
	aDie := Die withSides: 2.
	aGame := Game withPlayers:  {player1.player2} withDice:{aDie}.
	self assert: ( aGame  playersAmount =2).
	self assert: ( aGame  diceAmount =1).
]

{ #category : #tests }
GameTest >> test03CreateAGameWithTwoPlayersAndTwoDice [
	"prueba con dos dados"
	| aGame player1 player2 aDie anotherDie|
	player1 := Player start.
	player2 := Player start.
	aDie := Die withSides: 2.
	anotherDie := Die withSides: 4. 
	aGame := Game withPlayers:  {player1.player2} withDice:{aDie.anotherDie}.
	self assert: ( aGame  playersAmount =2).
	self assert: ( aGame  diceAmount =2).
]

{ #category : #tests }
GameTest >> test04CreateAGameWithTwoPlayersAndTwoDiceAndABoard [
	"prueba con dos dados"
	| aGame player1 player2 aDie anotherDie aBoard|
	player1 := Player start.
	player2 := Player start.
	aDie := Die withSides: 2.
	anotherDie := Die withSides: 4. 
	aBoard := Board withSlots: 25.
	aGame := Game withPlayers:  {player1.player2} withDice:{aDie.anotherDie} withBoard: aBoard.
	self assert: (aGame  boardSlotsAmount = 25).
]

{ #category : #tests }
GameTest >> test05AGameWithTwoPlayersAndADieAndABoardHasNotFinished [
	
	| aGame player1 player2 aDie aBoard|
	player1 := Player start.
	player2 := Player start.
	aDie := Die withSides: 2.
	aBoard :=Board withSlots: 2.
	aGame := Game withPlayers:  {player1.player2} withDice: {aDie} withBoard: aBoard.
	self deny: ( aGame  hasFinished ).

]

{ #category : #tests }
GameTest >> test06AGameWithScoreboard [
	
	| aGame player1 player2 aDie aBoard|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 2.
	aBoard :=Board withSlots: 2.
	aGame := Game withPlayers:  {player1.player2} withDice: {aDie} withBoard: aBoard.
	self assert: ( (aGame  playerScore: 'Gaspar') = 0 ).
	self assert: ( (aGame  playerScore: 'Martin') = 0 ).

]

{ #category : #tests }
GameTest >> test07AGameWithScoreboardMovesForward [
	
	| aGame player1 player2 aDie aDice aBoard|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 2.
	aDice := Dice from:{aDie}.
	aBoard :=Board withSlots: 2.
	aGame := Game withPlayers:  {player1.player2} withDice:aDice withBoard: aBoard.
	aGame playerMove: player1.
	self assert: ( (aGame  playerScore: 'Gaspar') between:1 and: 2).
	self assert: ( (aGame  playerScore: 'Martin') = 0 ).

]

{ #category : #tests }
GameTest >> test08AGameWithScoreboardTestLeader [
	
	| aGame player1 player2 aDie aBoard aLeader|
	player1 := Player startWithName: 'Gaspar'.
	player2 := Player startWithName: 'Martin'.
	aDie := Die withSides: 2.
	aBoard :=Board withSlots: 2.
	aGame := Game withPlayers:  {player1.player2} withDice: {aDie} withBoard: aBoard.
	aGame playerMove: player1.
	aLeader :=aGame leader.
	self assert: ( aLeader  = 1 ).


]
