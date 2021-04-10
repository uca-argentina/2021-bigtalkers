Class {
	#name : #Die,
	#superclass : #Object,
	#instVars : [
		'sides'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #attributes }
Die >> sidesAmmount [
	^sides
]

{ #category : #'item creation' }
Die >> withSides: aNumberOfSides [
	 sides := aNumberOfSides
]
