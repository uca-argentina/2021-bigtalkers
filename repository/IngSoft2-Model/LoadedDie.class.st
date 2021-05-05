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
	self validateLoadedDieCannotHaveNegativeResult: anExpectedRoll.
	^ self new initializeUsing: anExpectedRoll.
]

{ #category : #validation }
LoadedDie class >> validateLoadedDieCannotHaveNegativeResult: anExpectedRoll [

	anExpectedRoll negative
		ifTrue: [ Error signal: 'A loaded die cannot have a negative result' ]
]

{ #category : #initialize }
LoadedDie >> initializeUsing: anExpectedRoll [
	
	rollValue := anExpectedRoll.
]

{ #category : #function }
LoadedDie >> roll [

	^ rollValue.
]
