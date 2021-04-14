Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedDie class >> withSides: aNumberOfSides [ 
	^self new initializeUsing: aNumberOfSides.
]

{ #category : #initialize }
LoadedDie >> initializeUsing: aNumberOfSides [
	sides := aNumberOfSides 
]

{ #category : #function }
LoadedDie >> roll [
	^sides.
]

{ #category : #validation }
LoadedDie >> sidesAmmount [
	^sides.
]
