Class {
	#name : #WormHole,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
WormHole >> applyTo: aGame toPlayer: aPlayer [

	aGame applyWormHoleTo: aPlayer
]
