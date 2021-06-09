Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #validation }
Dice class >> validateEmptyDiceCollection: someDice [

	someDice isEmpty
		ifTrue: [ Error signal: 'Dice need to have at least one Die' ]
]

{ #category : #'instance creation' }
Dice class >> with: someDice [

	self validateEmptyDiceCollection: someDice.
	^ self new initializeWith: someDice
]

{ #category : #initialization }
Dice >> initializeWith: aDiceCollection [

	dice := aDiceCollection
]

{ #category : #rolling }
Dice >> roll [

	^ dice sum: [ :die | die roll ]
]
