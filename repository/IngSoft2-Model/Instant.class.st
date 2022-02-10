Class {
	#name : #Instant,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Instant >> applyOn: aGame to: affected [

	^self subclassResponsibility
]

{ #category : #'card - effect applications' }
Instant >> isPermanent [

	^false
]

{ #category : #'private - validations' }
Instant >> playableBy: aPlayer on: aGame affecting: target [

	^ self subclassResponsibility
]
