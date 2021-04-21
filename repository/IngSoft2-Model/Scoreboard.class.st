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
Scoreboard >> currentPosition: aPlayerName [
	^scoreboard at: aPlayerName.
]

{ #category : #initialize }
Scoreboard >> initializeWithPlayers: aCollectionOfPlayers [ 
 	scoreboard := Dictionary new.
	aCollectionOfPlayers do: 
		[ :player | scoreboard add: (player playerName) -> (0 ) ].
]

{ #category : #function }
Scoreboard >> leaderName [
|topScore topPlayerName| 
	topScore := 0.
	scoreboard  associationsDo: 
		[ :score | (topScore < score value) ifTrue: [topScore := score value. topPlayerName := score key] ].
	^topPlayerName.
]

{ #category : #function }
Scoreboard >> leaderScore [
|topScore | 
	topScore := 0.
	scoreboard  associationsDo: 
		[ :score | (topScore < score value) ifTrue: [topScore := score value] ].
	^topScore.
]

{ #category : #function }
Scoreboard >> playerRank: aPlayer [ 
	| place aSortedCollectionOfPlayerPositions|
	
	aSortedCollectionOfPlayerPositions := SortedCollection withAll: (Set withAll: (scoreboard collect: [:score | score])).
	place := aSortedCollectionOfPlayerPositions size.
	
	aSortedCollectionOfPlayerPositions do: 
		[ :score | ( (scoreboard at: (aPlayer playerName)) = score )  ifTrue: [^place.] 	ifFalse: [place := place - 1]].
	
	
]

{ #category : #function }
Scoreboard >> updatePosition: aPlayer slots: aNumberOfSlots [
	|currentPosition|
	currentPosition := scoreboard  at: (aPlayer playerName ).
	
	scoreboard add: (aPlayer playerName) -> (currentPosition  + aNumberOfSlots )
]
