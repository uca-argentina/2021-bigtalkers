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

	self validate: anExpectedRoll.
	^ self new initializeWith: anExpectedRoll
]

{ #category : #validation }
LoadedDie class >> validate: anExpectedRoll [

	self validateLoadedDieCannotHaveNegativeResult: anExpectedRoll

]

{ #category : #validation }
LoadedDie class >> validateLoadedDieCannotHaveNegativeResult: anExpectedRoll [

	anExpectedRoll negative
		ifTrue: [ Error signal: 'A loaded die cannot have a negative result' ]
]

{ #category : #initialization }
LoadedDie >> initializeWith: anExpectedRoll [
	
	rollValue := anExpectedRoll.
]

{ #category : #rolling }
LoadedDie >> roll [

	^ rollValue
]
