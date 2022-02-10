Class {
	#name : #Speed,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #'accessing - effect' }
Speed >> effect [

	^1 
]

{ #category : #'private - validations' }
Speed >> playableBy: aPlayer on: aGame affecting: target [

	aGame currentTurnPlayer  ~= aPlayer ifTrue: [ Error
				signal: 'Players can only play permanent cards during their turn' ].
]
