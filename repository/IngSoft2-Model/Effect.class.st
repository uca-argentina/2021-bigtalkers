Class {
	#name : #Effect,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'effect-application' }
Effect >> applyTo: aGame [

	^ self subclassResponsibility
]
