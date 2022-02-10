Class {
	#name : #Overload,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #'accessing - effect' }
Overload >> effect [

	^ -2
]

{ #category : #'private - validations' }
Overload >> playableBy: aPlayer on: aGame affecting: target [

	aGame currentTurnPlayer  ~= aPlayer ifTrue: [ Error
				signal: 'Players can only play permanent cards during their turn' ].
]
