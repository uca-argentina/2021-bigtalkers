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

	^ self new initializeWith: somePlayers
]

{ #category : #initialization }
Scoreboard >> initializeWith: somePlayers [

	scoreboard := Dictionary new.
	somePlayers
		do: [ :player | scoreboard at: player put: Position startingPosition ]
]

{ #category : #'accessing - leader' }
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

{ #category : #'accessing - leader' }
Scoreboard >> leaderLap [

	^ self leader value currentLap
]

{ #category : #'accessing - leader' }
Scoreboard >> leaderPosition [

	^ self leader value currentSlot
]

{ #category : #private }
Scoreboard >> positions [

	^ scoreboard collect: [ :score | score value ]
]

{ #category : #'accessing - leader' }
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
Scoreboard >> update: playerPositions [

	scoreboard := playerPositions
]
