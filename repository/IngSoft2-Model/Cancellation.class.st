Class {
	#name : #Cancellation,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Cancellation >> applyOn: aGame to: affected [

	aGame removeActiveCard: affected
]
