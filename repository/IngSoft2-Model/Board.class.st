Class {
	#name : #Board,
	#superclass : #Object,
	#instVars : [
		'slots',
		'seedGenerator',
		'playerPositions'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Board class >> sizedWithNoEffects: aNumberOfSlots [
	| slots |
	self validateMinimumSlots: aNumberOfSlots.
	slots := OrderedCollection new.
	1 to: aNumberOfSlots do: [ :iter | slots add: BoardSlot withNoEffect  ].
	^ self new initializeUsingEffects: slots
]

{ #category : #validation }
Board class >> validateMinimumSlots: aNumberOfSlots [

	aNumberOfSlots > 0
		ifFalse: [ Error signal: 'Boards need at least one slot' ]
]

{ #category : #'instance creation' }
Board class >> withAll: aCollectionOfSlots [

	^ self new initializeUsingEffects: aCollectionOfSlots
]

{ #category : #adding }
Board >> addPlayers: somePlayers [

	somePlayers do: [ :player | 
		playerPositions at: player put: Position startingPosition ]
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

{ #category : #initialize }
Board >> initializeUsingEffects: aCollectionOfSlots [

	slots := OrderedCollection new.
	playerPositions := Dictionary new.
	aCollectionOfSlots do: [ :slot | slots add: slot ]
]

{ #category : #private }
Board >> movePlayer: aPlayer to: valueToMove [

	| playerPosition newPosition boardsize|
	playerPosition := self currentSlotOf: aPlayer.
	boardsize := slots size.
	newPosition := valueToMove + playerPosition.
	newPosition > boardsize
		ifTrue: [ self
				updatePositionAddingLapsTo: aPlayer
				withValue: newPosition - boardsize ]
		ifFalse: [ newPosition < 0
				ifTrue: [ self updatePositionRemovingLapsTo: aPlayer withValue: newPosition ]
				ifFalse: [ self updatePositionAddingNoLapsTo: aPlayer withValue: valueToMove ] ]
	
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

{ #category : #'accessing - slots' }
Board >> slotsAmount [

	^ slots size
]

{ #category : #private }
Board >> updatePositionAddingLapsTo: aPlayer withValue: valueToMove [

	self updatePositionOf: aPlayer slots: valueToMove laps: 1
]

{ #category : #private }
Board >> updatePositionAddingNoLapsTo: aPlayer withValue: valueToMove [

	self updatePositionOf: aPlayer slots: valueToMove laps: 0
]

{ #category : #private }
Board >> updatePositionOf: aPlayer slots: aNumberOfSlots laps: aNumberOfLaps [

	| currentPosition |
	currentPosition := playerPositions at: aPlayer.
	currentPosition addLaps: aNumberOfLaps.
	playerPositions at: aPlayer put: currentPosition + aNumberOfSlots.
	(self currentLapOf: aPlayer) < 0 ifTrue: [ self reset: aPlayer ]
]

{ #category : #private }
Board >> updatePositionRemovingLapsTo: aPlayer withValue: newPosition [

	| updatedPosition |
	updatedPosition := (slots size) + newPosition.
	self  moveToStart: aPlayer.
	self  updatePositionOf: aPlayer slots: updatedPosition laps: -1
]
