Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'scoreboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Scoreboard class >> competingPlayers: aCollectionOfPlayers [ 
	^self new initializeWithPlayers: aCollectionOfPlayers
]

{ #category : #initialize }
Scoreboard >> currentPosition: aPlayer [
	^scoreboard at: aPlayer.
]

{ #category : #initialize }
Scoreboard >> initializeWithPlayers: aCollectionOfPlayers [
	scoreboard := Dictionary new.
	aCollectionOfPlayers
		do: [ :player | scoreboard at: player put: 0 ]
]

{ #category : #function }
Scoreboard >> leader [
	| topScore leader|
	topScore := 0.
	scoreboard
		associationsDo: [ :score | 
			topScore < score value
				ifTrue: [ topScore := score value. leader := score ] ].
	^ leader
]

{ #category : #function }
Scoreboard >> leaderName [
	^(self leader key) playerName .
]

{ #category : #function }
Scoreboard >> leaderScore [
	^ self leader value
]

{ #category : #function }
Scoreboard >> playerRank: aPlayer [
	| place playerPlaces |
	playerPlaces := SortedCollection
		withAll: (Set withAll: scoreboard values).
	place := playerPlaces size.
	playerPlaces
		do: [ :score | 
			(scoreboard at: aPlayer) = score
				ifTrue: [ ^ place ]
				ifFalse: [ place := place - 1 ] ]
]

{ #category : #function }
Scoreboard >> updatePosition: aPlayer slots: aNumberOfSlots [
	|currentPosition|
	currentPosition := scoreboard  at: aPlayer.
	
	scoreboard at: aPlayer put: (currentPosition  + aNumberOfSlots )
]
