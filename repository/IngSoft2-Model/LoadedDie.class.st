Class {
	#name : #LoadedDie,
	#superclass : #Object,
	#instVars : [
		'rollValue'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
LoadedDie class >> rolling: anExpectedRoll [ 
	^self new initializeUsing: anExpectedRoll.
]

{ #category : #initialize }
LoadedDie >> initializeUsing: anExpectedRoll [
	rollValue := anExpectedRoll.
]

{ #category : #function }
LoadedDie >> roll [
	^rollValue .
]
