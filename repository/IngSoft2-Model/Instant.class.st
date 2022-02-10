Class {
	#name : #Instant,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Instant >> applyOn: aGame to: target [

	^self subclassResponsibility
]

{ #category : #'private - validations' }
Instant >> playableBy: aPlayer on: aGame affecting: target [

	^ self subclassResponsibility
]
