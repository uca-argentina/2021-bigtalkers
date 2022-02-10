Class {
	#name : #Permanent,
	#superclass : #Card,
	#instVars : [
		'effect'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Permanent >> applyOn: aGame to: affected [
	
	aGame addActiveCard: self on: affected 
	
]

{ #category : #'accessing - effect' }
Permanent >> effect [

	^ self subclassResponsibility
]

{ #category : #'card - effect applications' }
Permanent >> isPermanent [

	^ true
]

{ #category : #'card - effect applications' }
Permanent >> playableBy: aPlayer on: aGame [ 

	aGame currentTurnPlayer  ~= aPlayer ifTrue: [ Error
				signal: 'Players can only play permanent cards during their turn' ].
]
