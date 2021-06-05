Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
SpeedUp >> applyTo: aGame [

	aGame applySpeedUp
]

{ #category : #'effect-application' }
SpeedUp >> applyTo: aGame toPlayer: aPlayer [

	aGame applySpeedUpTo: aPlayer
	
]
