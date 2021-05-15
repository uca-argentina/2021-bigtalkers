Class {
	#name : #LoadedBoard,
	#superclass : #Board,
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedBoard class >> using: aSeedGenerator [
	^self new initializeUsingASeedGenerator: aSeedGenerator. 
]

{ #category : #initialization }
LoadedBoard >> initializeUsingASeedGenerator: aSeedGenerator [ 
	seed := aSeedGenerator.
	slots := seed getSlots.
]
