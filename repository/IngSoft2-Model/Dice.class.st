Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> with: aDiceCollection [
^self new initializeUsing: aDiceCollection . 
]

{ #category : #initialize }
Dice >> initializeUsing: aDiceCollection [ 
	dice := aDiceCollection 
]

{ #category : #function }
Dice >> roll [
	^(dice sum: [:die| die roll ])
]
