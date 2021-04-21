Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedDie class >> alwaysFallsOn: aNumber [ 
	^self new initializeUsing: aNumber.
]

{ #category : #initialize }
LoadedDie >> initializeUsing: aNumberOfSides [
	sides := aNumberOfSides 
]

{ #category : #function }
LoadedDie >> roll [
	^sides.
]
