Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots',
		'playerPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> sizedWithNoEffects: aNumberOfSlots [

	| slots |
	self validateMinimumSlots: aNumberOfSlots.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect ].
	^ self new initializeWithEffects: slots
]

{ #category : #'instance creation' }
Board class >> using: aBoardSlotGenerator withAmount: aNumberOfSlots [

	| slots |
	self validateMinimumSlots: aNumberOfSlots.
	slots := OrderedCollection new.
	slots := aBoardSlotGenerator generates: aNumberOfSlots.
	^ self new initializeWithEffects: slots



]

{ #category : #validation }
Board class >> validate: aNumberOfSlots [

	self validateMinimumSlots: aNumberOfSlots

]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #'instance creation' }
Board class >> withAll: aCollectionOfSlots [

	^ self new initializeWithEffects: aCollectionOfSlots
]

{ #category : #adding }
Board >> addPlayers: somePlayers [

	somePlayers
		do:
			[ :player | playerPositions at: player put: Position startingPosition ]
]

{ #category : #'accessing - positions' }
Board >> currentLapOf: aPlayer [

	^ (playerPositions at: aPlayer) currentLap
]

{ #category : #'accessing - positions' }
Board >> currentSlotOf: aPlayer [

	^ (playerPositions at: aPlayer) currentSlot
]

{ #category : #'accessing - slots' }
Board >> effectAt: aPosition [

	^ (self slotAt: aPosition) effect
]

{ #category : #initialization }
Board >> initializeWithEffects: aCollectionOfSlots [

	slots := aCollectionOfSlots .
	playerPositions := Dictionary new.

]

{ #category : #private }
Board >> movePlayer: aPlayer to: valueToMove [

	| playerPosition newPosition boardsize |
	playerPosition := self currentSlotOf: aPlayer.
	boardsize := slots size.
	newPosition := valueToMove + playerPosition.
	newPosition > boardsize
		ifTrue: [ self
				updatePlayerPosition: aPlayer
				toSlot: newPosition - boardsize
				addingLaps: 1 ]
		ifFalse: [ newPosition < 0
				ifTrue: [ self
						updatePlayerPosition: aPlayer
						toSlot: boardsize + newPosition
						addingLaps: -1 ]
				ifFalse: [ self
						updatePlayerPosition: aPlayer
						toSlot: valueToMove + playerPosition
						addingLaps: 0 ] ]
]

{ #category : #private }
Board >> moveToStart: aPlayer [

	| currentPosition |
	currentPosition := playerPositions at: aPlayer.
	currentPosition backToStart.
	playerPositions at: aPlayer put: currentPosition
]

{ #category : #'accessing - positions' }
Board >> playerPositions [

	^ playerPositions
]

{ #category : #private }
Board >> reset: aPlayer [

	| currentPosition |
	currentPosition := playerPositions at: aPlayer.
	currentPosition reset.
	playerPositions at: aPlayer put: currentPosition
]

{ #category : #'accessing - slots' }
Board >> slotAt: aPosition [

	^ slots at: aPosition
]

{ #category : #private }
Board >> updatePlayerPosition: aPlayer toSlot: aSlot addingLaps: aLap [

	| newLap newPosition |
	newLap := (self currentLapOf: aPlayer) + aLap.
	newPosition := Position atSlot: aSlot andLap: newLap.
	playerPositions at: aPlayer put: newPosition.
	(self currentLapOf: aPlayer) < 0
		ifTrue: [ self reset: aPlayer ]
]
