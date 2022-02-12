Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
Effect >> applyTo: aGame triggeredBy: aPlayer [

	^ self subclassResponsibility
]
