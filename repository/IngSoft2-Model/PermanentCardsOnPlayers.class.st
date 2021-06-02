Class {
	#name : #PermanentCardsOnPlayers,
	#superclass : #Object,
	#instVars : [
		'cardregistry'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'as yet unclassified' }
PermanentCardsOnPlayers class >> forPlayers: somePlayers [
	
	^self new initializeWithPlayers: somePlayers
]

{ #category : #initialization }
PermanentCardsOnPlayers >> add: aCard to: aPlayer [

	| currCards |
	currCards := cardregistry at: aPlayer.
	currCards add: aCard.
	cardregistry at: aPlayer put: currCards
]

{ #category : #initialization }
PermanentCardsOnPlayers >> cardsAffecting: aPlayer [

	^ cardregistry at: aPlayer
]

{ #category : #initialization }
PermanentCardsOnPlayers >> initializeWithPlayers: somePlayers [

	cardregistry  := Dictionary new.
	somePlayers
		do: [ :player | cardregistry at: player put: OrderedCollection new ]
]

{ #category : #initialization }
PermanentCardsOnPlayers >> playerRollModifier: aPlayer [

	| currCards |
	currCards := cardregistry at: aPlayer.
	^ currCards inject: 0 into: [ :prev :curr | prev+ (curr effect) ]
]
