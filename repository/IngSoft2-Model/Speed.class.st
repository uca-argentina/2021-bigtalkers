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

	(target isCollection and: [ target size > 1 ]) ifTrue: [ 
		Error signal: 'This card can only be played on 1 player' ].

	aGame currentTurnPlayer  ~= aPlayer ifTrue: [ Error
				signal: 'Players can only play permanent cards during their turn' ].
]
