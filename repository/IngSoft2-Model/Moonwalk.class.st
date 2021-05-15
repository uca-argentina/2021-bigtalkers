Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'N'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
Moonwalk >> applyTo: aGame [

	N := 2.
	aGame applyMoonWalk: N
]
