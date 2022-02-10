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

{ #category : #'private - validations' }
Cancellation >> playableBy: aPlayer on: aGame affecting: target [
	
	aGame activeCardStack isEmpty ifTrue: [ Error signal: 'Cant play cancellation with no active cards in game' ]
	
]
