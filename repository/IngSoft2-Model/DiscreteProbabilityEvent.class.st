Class {
	#name : #DiscreteProbabilityEvent,
	#superclass : #Object,
	#instVars : [
		'event',
		'probabilityOfEvent'
	],
	#category : #'IngSoft2-Model'
}

{ #category : #'instance creation' }
DiscreteProbabilityEvent class >> of: anEvent havingProbability: anEventProbability [

	self validate: anEventProbability.
	^ self new initiliazeWith: anEvent whichProbabilityIs: anEventProbability
]

{ #category : #validation }
DiscreteProbabilityEvent class >> validate: aProbability [

	self validatePositiveProbability: aProbability
]

{ #category : #validation }
DiscreteProbabilityEvent class >> validatePositiveProbability: aProbability [

	aProbability > 0
		ifFalse: [ Error signal: 'Probabilities must be positive' ]
]

{ #category : #'accessing - variables' }
DiscreteProbabilityEvent >> event [
	"Coverage issue: Message in use in BoardSlotGenerator >> initializeWith: "
	^event
]

{ #category : #initialization }
DiscreteProbabilityEvent >> initiliazeWith: anEvent whichProbabilityIs: anEventProbability [
	
	event := anEvent.
	probabilityOfEvent := anEventProbability. 
	
	

]

{ #category : #'accessing - variables' }
DiscreteProbabilityEvent >> probability [

	^probabilityOfEvent 
]
