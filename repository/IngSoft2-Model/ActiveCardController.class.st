Class {
	#name : #ActiveCardController,
	#superclass : #Object,
	#instVars : [
		'cardregistry'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
ActiveCardController class >> forPlayers: somePlayers [
	
	^self new initializeWith: somePlayers
]

{ #category : #'accessing - adding/removing' }
ActiveCardController >> add: aCard to: aPlayer [

	| currCards |
	currCards := cardregistry at: aPlayer.
	currCards add: aCard.
	cardregistry at: aPlayer put: currCards
]

{ #category : #initialization }
ActiveCardController >> initializeWith: somePlayers [

	cardregistry := Dictionary new.
	somePlayers
		do: [ :player | cardregistry at: player put: OrderedCollection new ]
]

{ #category : #validations }
ActiveCardController >> isEmpty [

	| activeCards |
	activeCards := cardregistry
		inject: 0
		into: [ :prev :curr | prev + curr size ].
	^ activeCards < 1
]

{ #category : #'accessing -  effects' }
ActiveCardController >> playerRollModifier: aPlayer [

	| currCards |
	currCards := cardregistry at: aPlayer.
	^ currCards inject: 0 into: [ :prev :curr | prev + curr effect ]
]

{ #category : #'accessing - adding/removing' }
ActiveCardController >> remove: aCard from: aPlayer [

	| currCards index |
	currCards := cardregistry at: aPlayer.
	index := currCards
		indexOf: aCard
		ifAbsent: [ Error signal: 'The player does not have that card' ].
	currCards removeAt: index
]
