Class {
	#name : #PlayerTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #test }
PlayerTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #test }
PlayerTest >> testCannotCreateAPlayerWithoutName [

	self
		should: [Player named: '']
		raise: Error 
		withMessage: 'A player cannot have an empty name'.
]

{ #category : #test }
PlayerTest >> testCreateAPlayerWithName [

	| aPlayer |
	aPlayer := Player named: 'Martin'.
	self assert: aPlayer playerName equals: 'Martin'
]
