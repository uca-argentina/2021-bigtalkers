Class {
	#name : #BoardTest,
	#superclass : #TestCase,
	#category : #'IngSoft2-Tests'
}

{ #category : #tests }
BoardTest >> test01CreateBoard [

| aBoard |
aBoard := Board withSlots: 30.

self assert: aBoard slotsAmount equals:   30.




]
