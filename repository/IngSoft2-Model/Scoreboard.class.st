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

{ #category : #private }
Scoreboard >> findBestScore [

	| bestScore |
	bestScore := Association key: false value: Position startingPosition.
	scoreboard associationsDo: [ :score | 
		bestScore := self score: bestScore betterThan: score ].
	^bestScore 
]

{ #category : #initialization }
Scoreboard >> initializeWith: somePlayers [

	scoreboard := Dictionary new.
	somePlayers
		do: [ :player | scoreboard at: player put: Position startingPosition ]
]

{ #category : #'accessing - leader' }
Scoreboard >> leader [

	^ self findBestScore
]

{ #category : #'accessing - leader' }
Scoreboard >> leaderLap [

	^ self leader value getLap
]

{ #category : #'accessing - leader' }
Scoreboard >> leaderPosition [

	^ self leader value getSlot
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
Scoreboard >> score: leader betterThan: anotherScore [
	leader value <= anotherScore value  ifTrue: [ ^anotherScore ].
	^leader
]

{ #category : #private }
Scoreboard >> update: playerPositions [

	scoreboard := playerPositions
]
