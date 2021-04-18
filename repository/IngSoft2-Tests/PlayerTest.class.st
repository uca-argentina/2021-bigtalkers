Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #test }
PlayerTest >> testCreatePlayerWithName [
	| aPlayer |
	aPlayer := Player startWithName: 'Martin'.
	self assert: (aPlayer playerName) equals: 'Martin'.
]
