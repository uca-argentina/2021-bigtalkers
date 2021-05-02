Class {
	#name : #Player,
	#superclass : #Object,
	#instVars : [
		'name'
	],
	#classInstVars : [
		'position'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Player class >> named: aName [
	^self new initializeWithName: aName.
]

{ #category : #validation }
Player class >> validatesPlayerWithAnEmptyName: aName [
	(aName = '')
		ifTrue: [ Error signal: 'A player can not have an empty name' ]
]

{ #category : #initialize }
Player >> initializeWithName: aName [
	self class validatesPlayerWithAnEmptyName: aName.
	name := aName.
]

{ #category : #'testing - variables' }
Player >> playerName [
	^name.
]
