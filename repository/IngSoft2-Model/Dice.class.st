Class {
	#name : #Dice,
	#superclass : #Object,
	#instVars : [
		'dice'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
Dice >> from: aDiceCollection [ 
	dice := aDiceCollection 
]

{ #category : #functions }
Dice >> roll [
	^(dice sum: [:die| die roll ])
]
