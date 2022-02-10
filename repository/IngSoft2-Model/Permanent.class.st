Class {
	#name : #Permanent,
	#superclass : #Card,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Permanent >> applyOn: aGame to: target [
	
	aGame addActiveCard: self on: target 
	
]

{ #category : #'accessing - effect' }
Permanent >> effect [

	^ self subclassResponsibility
]

{ #category : #'private - validations' }
Permanent >> playableBy: aPlayer on: aGame affecting: target [

	^ self subclassResponsibility 
]
