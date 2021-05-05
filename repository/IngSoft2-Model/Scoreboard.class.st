Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'scoreboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Scoreboard class >> competingPlayers: somePlayers [

	^ self new initializeWithPlayers: somePlayers.
]

{ #category : #initialize }
Scoreboard >> currentPosition: aPlayer [

	^ (scoreboard at: aPlayer) position.
]

{ #category : #initialize }
Scoreboard >> initializeWithPlayers: somePlayers [ 

	scoreboard := Dictionary new.
	somePlayers do: [ :player | scoreboard at: player put: Position startingPosition  ].
]

{ #category : #function }
Scoreboard >> leader [

	| topScore leader |
	topScore := Position startingPosition .
	scoreboard
		associationsDo: [ :score | 
			topScore < score value
				ifTrue: [ topScore := score value.
					leader := score ] ].
	^ leader.
]

{ #category : #function }
Scoreboard >> leaderName [

	^ self leader key playerName.
]

{ #category : #function }
Scoreboard >> leaderScore [
	^ self leader value position
]

{ #category : #function }
Scoreboard >> playerRank: aPlayer [
	| place playerPlaces |
	playerPlaces := SortedCollection
		withAll: (Set withAll: self positions).
	place := playerPlaces size.
	playerPlaces
		do: [ :score | 
			(self currentPosition: aPlayer) = score
				ifTrue: [ ^ place ]
				ifFalse: [ place := place - 1 ] ]
]

{ #category : #private }
Scoreboard >> positions [
	^scoreboard collect: [ :score | score value position ]
]

{ #category : #function }
Scoreboard >> updatePosition: aPlayer slots: aNumberOfSlots [

	| currentPosition |
	currentPosition := scoreboard at: aPlayer.
	scoreboard at: aPlayer put: currentPosition + aNumberOfSlots.
]
