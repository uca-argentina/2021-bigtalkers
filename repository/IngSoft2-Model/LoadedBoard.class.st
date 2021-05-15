Class {
	#name : #LoadedBoard,
	#superclass : #Board,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedBoard class >> seeding: aSeedGenerator [

	^self new initializeWith: aSeedGenerator. 
]

{ #category : #initialization }
LoadedBoard >> initializeWith: aSeedGenerator [

	seedGenerator := aSeedGenerator.
	slots := seedGenerator getAllSlots
]
