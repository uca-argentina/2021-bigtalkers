Class {
	#name : #Cancellation,
	#superclass : #Instant,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Cancellation >> applyOn: aGame to: affected [

	| cancelledCard player |
	cancelledCard := affected at: 1.
	player := affected at: 2.
	aGame removeActiveCard: cancelledCard from: player
]
