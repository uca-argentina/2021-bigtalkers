Class {
	#name : #Card,
	#superclass : #Object,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Card >> applyOn: aGame to: affected [

	^ self subclassResponsibility
]
