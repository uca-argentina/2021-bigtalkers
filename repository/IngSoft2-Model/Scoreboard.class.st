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

{ #category : #initialization }
Scoreboard >> updatePositions: aCollectionOfPlayers [ 
	
	aCollectionOfPlayers do: [ :player | scoreboard add: (player playerName) -> (player playerPosition ) ]
]
