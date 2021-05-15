Class {
	#name : #LoadedBoard,
	#superclass : #Board,
	#category : #'IngSoft2-Model'
}

{ #category : #initialization }
LoadedBoard >> initialize [
	slots := seed getSlots.
]
