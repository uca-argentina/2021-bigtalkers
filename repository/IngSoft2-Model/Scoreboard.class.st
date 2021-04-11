Class {
	#name : #Scoreboard,
	#superclass : #Object,
	#instVars : [
		'scoreboard'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Scoreboard class >> withPlayers: aCollectionOfPlayers [ 
	^self new initializeWithPlayers: aCollectionOfPlayers
]

{ #category : #initialization }
Scoreboard >> currentPosition: aPlayerName [
	^scoreboard at: aPlayerName.
]

{ #category : #initialization }
Scoreboard >> initializeWithPlayers: aCollectionOfPlayers [ 
 	scoreboard := Dictionary new.
	
	aCollectionOfPlayers do: [ :player | scoreboard add: (player playerName) -> (player playerPosition ) ].
]

{ #category : #action }
Scoreboard >> leader [
|topScore| 
	topScore := 0.
	scoreboard  do: [ :score | (topScore < score) ifTrue: [topScore := score] ].
	^topScore.
]

{ #category : #action }
Scoreboard >> updatePositions: aCollectionOfPlayers [ 
	
	aCollectionOfPlayers do: [ :player | scoreboard add: (player playerName) -> (player playerPosition ) ]
]
