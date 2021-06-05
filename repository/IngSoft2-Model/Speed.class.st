Class {
	#name : #Speed,
	#superclass : #Permanent,
	#category : #'IngSoft2-Model'
}

{ #category : #'card - effect applications' }
Speed >> applyOn: aGame to: affected [
	aGame addActiveCard: self.
	affected addAffectingCard: self.
]

{ #category : #'accessing - effect' }
Speed >> effect [

	^1 
]
