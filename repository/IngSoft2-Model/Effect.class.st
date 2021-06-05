Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
Effect >> applyTo: aGame [

	^ self subclassResponsibility
]

{ #category : #'effect-application' }
Effect >> applyTo: aGame toPlayer: aPlayer [

	^ self subclassResponsibility
]
