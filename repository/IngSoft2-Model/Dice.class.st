Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Dice class >> validateEmptyDiceCollection: aDiceCollection [

	aDiceCollection isEmpty
		ifTrue: [ Error signal: 'Dice need to have at least one Die' ]
]

{ #category : #'instance creation' }
Dice class >> with: aDiceCollection [

	self validateEmptyDiceCollection: aDiceCollection.
	^ self new initializeUsing: aDiceCollection
]

{ #category : #initialize }
Dice >> initializeUsing: aDiceCollection [

	dice := aDiceCollection
]

{ #category : #action }
Dice >> roll [

	^ dice sum: [ :die | die roll ]
]
