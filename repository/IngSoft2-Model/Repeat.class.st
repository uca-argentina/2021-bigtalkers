Class {
	#name : #Repeat,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Repeat >> applyOn: aGame to: aPlayer [

	aGame applyLastEffectTo: aPlayer
]
