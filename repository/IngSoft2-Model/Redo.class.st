Class {
	#name : #Redo,
	#superclass : #Card,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Redo >> applyOn: aGame to: affected [

	aGame applyLastCardTo: affected
]

{ #category : #'card - effect applications' }
Redo >> isPermanent [

	^ false
]
