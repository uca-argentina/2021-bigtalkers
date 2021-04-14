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
Scoreboard >> leaderName [
|topScore topPlayerName| 
	topScore := 0.
	scoreboard  associationsDo: [ :score | (topScore < score value) ifTrue: [topScore := score value. topPlayerName := score key] ].
	^topPlayerName.
]

{ #category : #action }
Scoreboard >> leaderScore [
|topScore | 
	topScore := 0.
	scoreboard  associationsDo: [ :score | (topScore < score value) ifTrue: [topScore := score value] ].
	^topScore.
]

{ #category : #action }
Scoreboard >> playerRank: aPlayer [ 
	| position aSortedCollection aSet|
	aSet := Set new.
	aSortedCollection := SortedCollection new.
	scoreboard  do: [ :score | (aSet add: score) ].
	aSet do:  [ :score | (aSortedCollection add: score)  ].
	position := aSortedCollection size.
	aSortedCollection do: [ :score | ((scoreboard at: (aPlayer playerName) ) = score )  ifTrue: [^position.] 	ifFalse: [position := 	position - 1]].
	
	
]

{ #category : #action }
Scoreboard >> updatePositions: aCollectionOfPlayers [ 
	
	aCollectionOfPlayers do: [ :player | scoreboard add: (player playerName) -> (player playerPosition ) ]
]
