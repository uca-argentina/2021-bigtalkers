Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players',
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers [
	^self new initializeWith: aCollectionOfPlayers .
]

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers withDice: aCollectionOfDice [ 
	^self new initializeWithPlayers: aCollectionOfPlayers withDice: aCollectionOfDice.
]

{ #category : #validation }
Game >> diceAmount [
	^dice size.
]

{ #category : #initialization }
Game >> initializeWith: aCollectionOfPlayers [
	players:= aCollectionOfPlayers.
]

{ #category : #initialization }
Game >> initializeWithPlayers: aCollectionOfPlayers withDice: aDiceCollection [ 
	players:= aCollectionOfPlayers.
	dice := aDiceCollection.
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]

{ #category : #validation }
Game >> playersAmount: aNumberOfPlayers [ 
	^(players size = aNumberOfPlayers).
]
