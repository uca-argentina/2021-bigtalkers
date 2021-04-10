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
