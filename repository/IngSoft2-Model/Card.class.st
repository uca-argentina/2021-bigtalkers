Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Card >> = anotherCard [

	^ self className = anotherCard className
]

{ #category : #'card - effect applications' }
Card >> applyOn: aGame to: affected [

	^ self subclassResponsibility
]

{ #category : #'card - effect applications' }
Card >> isPermanent [

	^ self subclassResponsibility
]

{ #category : #'private - validations' }
Card >> playableBy: aPlayer on: aGame affecting: affected [

	^ self subclassResponsibility
]
