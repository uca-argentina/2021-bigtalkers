Class {
	#name : #Effect,
	#superclass : #Object,
	#instVars : [
		'probability'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #operations }
Effect >> applyTo: aGame [
	^ self subclassResponsibility
]
