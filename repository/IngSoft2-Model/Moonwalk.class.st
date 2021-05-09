Class {
	#name : #Moonwalk,
	#superclass : #Effect,
	#instVars : [
		'N'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Moonwalk >> applyTo: aGame [

	N := 2.
	aGame applyMoonWalk: N
]
