Class {
	#name : #SpeedUp,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
SpeedUp >> applyTo: aGame triggeredBy: aPlayer [

	aGame applySpeedUpTo: aPlayer
	
]
