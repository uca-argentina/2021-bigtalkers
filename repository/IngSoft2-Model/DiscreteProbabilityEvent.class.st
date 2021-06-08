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
DiscreteProbabilityEvent class >> of: anEvent with: anEventProbability [


	^self new initiliazeWith: anEvent with: anEventProbability. 
]

{ #category : #'as yet unclassified' }
DiscreteProbabilityEvent >> event [

	^event
]

{ #category : #initialize }
DiscreteProbabilityEvent >> initiliazeWith: anEvent with: anEventProbability [
	
	event := anEvent.
	probabilityOfEvent := anEventProbability. 
	
	

]

{ #category : #'as yet unclassified' }
DiscreteProbabilityEvent >> probability [

	^probabilityOfEvent 
]
