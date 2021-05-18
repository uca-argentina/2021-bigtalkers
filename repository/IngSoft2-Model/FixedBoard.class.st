Class {
	#name : #FixedBoard,
	#superclass : #Board,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
FixedBoard class >> seeding: aSeedGenerator [

	^self new initializeWith: aSeedGenerator. 
]

{ #category : #initialization }
FixedBoard >> initializeWith: aSeedGenerator [

	seedGenerator := aSeedGenerator.
	slots := seedGenerator getAllSlots
]
