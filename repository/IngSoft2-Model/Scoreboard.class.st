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

	^ self new initializeWithPlayers: somePlayers
]

{ #category : #initialize }
Scoreboard >> currentLapOf: aPlayer [

	^ (scoreboard at: aPlayer) lap
]

{ #category : #initialize }
Scoreboard >> currentPositionOf: aPlayer [

	^ (scoreboard at: aPlayer) position
]

{ #category : #initialize }
Scoreboard >> initializeWithPlayers: somePlayers [ 

	scoreboard := Dictionary new.
	somePlayers do: [ :player | scoreboard at: player put: Position startingPosition  ].
]

{ #category : #'testing - leader' }
Scoreboard >> leader [

	| topScore leader |
	topScore := Position startingPosition.
	scoreboard
		associationsDo: [ :score | 
			topScore <= score value
				ifTrue: [ topScore := score value.
					leader := score ] ].
	^ leader
]

{ #category : #'testing - leader' }
Scoreboard >> leaderLap [

	^ self leader value lap
]

{ #category : #'testing - leader' }
Scoreboard >> leaderName [

	^ self leader key playerName
]

{ #category : #'testing - leader' }
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

{ #category : #private }
Scoreboard >> positions [

	^ scoreboard collect: [ :score | score value ]
]

{ #category : #'testing - leader' }
Scoreboard >> rankOf: aPlayer [

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
Scoreboard >> reset: aPlayer [

	| currentPosition |
	currentPosition := scoreboard at: aPlayer.
	currentPosition reset.
	scoreboard at: aPlayer put: currentPosition
]

{ #category : #private }
Scoreboard >> updatePositionOf: aPlayer slots: aNumberOfSlots laps: aNumberOfLaps [
	| currentPosition |
	currentPosition := scoreboard at: aPlayer.
	currentPosition addLaps: aNumberOfLaps.
	scoreboard at: aPlayer put: currentPosition + aNumberOfSlots.
	(self currentLapOf: aPlayer) < 0
		ifTrue: [ self reset: aPlayer ]
]
