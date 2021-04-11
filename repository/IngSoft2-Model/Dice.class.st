Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice class >> from: aDiceCollection [
^self new initializeUsing: aDiceCollection . 
]

{ #category : #initialization }
Dice >> initializeUsing: aDiceCollection [ 
	dice := aDiceCollection 
]

{ #category : #functions }
Dice >> roll [
	^(dice sum: [:die| die roll ])
]
