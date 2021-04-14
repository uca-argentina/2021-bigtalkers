Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #test }
PlayerTest >> test01CreatePlayer [
	| aPlayer |
	aPlayer := Player start.
	self assert: (aPlayer isAt: 0).
]

{ #category : #test }
PlayerTest >> test02APlayerMovesForward [
	| aPlayer |
	aPlayer := Player start.
	aPlayer movesForward: 1.
	self assert: (aPlayer isAt: 1).
]

{ #category : #test }
PlayerTest >> test03CreatePlayerWithName [
	| aPlayer |
	aPlayer := Player startWithName: 'Martin'.
	self assert: (aPlayer playerName) equals: 'Martin'.
]
