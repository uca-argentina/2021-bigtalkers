Class {
	#name : #AtomicBomb,
	#superclass : #Effect,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
AtomicBomb >> applyTo: aGame triggeredBy: aPlayer [

	aGame applyAtomicBombTo: aPlayer. 
]
