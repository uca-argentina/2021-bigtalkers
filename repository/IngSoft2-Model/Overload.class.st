Class {
	#name : #Overload,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Overload >> applyOn: aGame to: affected [
	aGame addActiveCard: self.
	
]

{ #category : #'accessing - effect' }
Overload >> effect [
	^ -2
]
