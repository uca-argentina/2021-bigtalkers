Class {
	#name : #GrabCard,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
GrabCard >> applyTo: aGame toPlayer: aPlayer [

	aGame drawFromDeck: aPlayer
]
