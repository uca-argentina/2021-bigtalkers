Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #asserting }
BoardTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ].
]

{ #category : #tests }
BoardTest >> testCreateBoard [

	| aBoard |
	aBoard := Board sized: 30.
	self assert: aBoard slotsAmount equals: 30.
]

{ #category : #tests }
BoardTest >> testCreateBoardWith0Slots [

	self
		should: [ Board sized: 0 ]
		raise: Error
		withMessage: 'Boards need at least one slot'.
]
