Class {
	#name : #Game,
	#superclass : #Object,
	#instVars : [
		'players'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Game class >> withPlayers: aCollectionOfPlayers [
	^self new initializeWith: aCollectionOfPlayers .
]

{ #category : #initialization }
Game >> initializeWith: aCollectionOfPlayers [
	players:= aCollectionOfPlayers.
]

{ #category : #validation }
Game >> playersAmount [
	^players size.
]

{ #category : #validation }
Game >> playersAmount: aNumberOfPlayers [ 
	^(players size = aNumberOfPlayers).
]
