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
Scoreboard >> currentLap: aPlayer [

	^ (scoreboard at: aPlayer) lap.
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

{ #category : #acccessing }
Scoreboard >> leader [

	| topScore leader |
	topScore := Position startingPosition .
	scoreboard
		associationsDo: [ :score | 
			topScore <= score value
				ifTrue: [ topScore := score value.
					leader := score ] ].
	^ leader.
]

{ #category : #acccessing }
Scoreboard >> leaderLap [
	^ self leader value lap
]

{ #category : #acccessing }
Scoreboard >> leaderName [

	^ self leader key playerName.
]

{ #category : #acccessing }
Scoreboard >> leaderPosition [
	^ self leader value position
]

{ #category : #private }
Scoreboard >> moveToStart: aPlayer [

	| currentPosition |
	currentPosition := scoreboard at: aPlayer.
	currentPosition backToStart.
	scoreboard at: aPlayer put: currentPosition
]

{ #category : #acccessing }
Scoreboard >> playerRank: aPlayer [
	| place playerPlaces |
	playerPlaces := SortedCollection withAll: self positions.
	place := 1.
	playerPlaces
		do: [ :score | 
			(scoreboard at: aPlayer) >= score
				ifFalse: [ place := place + 1 ] ].
	^ place
]

{ #category : #private }
Scoreboard >> positions [

	^ scoreboard collect: [ :score | score value ]
]

{ #category : #private }
Scoreboard >> updatePosition: aPlayer slots: aNumberOfSlots laps: aNumberOfLaps [

	| currentPosition |
	currentPosition := scoreboard at: aPlayer.
	1 to: aNumberOfLaps do: [ :lap | currentPosition addLap ].
	scoreboard at: aPlayer put: currentPosition + aNumberOfSlots
]
