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
