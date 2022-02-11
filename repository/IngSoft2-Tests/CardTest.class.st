Class {
	#name : #CardTest,
	#superclass : #TestCase,
	#instVars : [
		'player1',
		'player2',
		'player3',
		'redoDeck',
		'speedDeck',
		'overloadDeck',
		'repeatDeck',
		'accelerationDeck',
		'cancellationDeck',
		'speedCard',
		'overloadCard',
		'accelerationCard',
		'repeatCard',
		'redoCard',
		'cancellationCard'
	],
	#category : #'IngSoft2-Tests'
}

{ #category : #running }
CardTest >> setUp [

	player1 := Player named: 'Gaspar'.
	player2 := Player named: 'Martin'.
	player3 := Player named: 'Carla'.
	redoDeck := Deck onlyRedoCards.
	speedDeck := Deck onlySpeedCards.
	overloadDeck := Deck onlyOverloadCards.
	repeatDeck := Deck onlyRepeatCards.
	accelerationDeck := Deck onlyAccelerationCards.
	cancellationDeck := Deck onlyCancellationCards.
	speedCard := Speed new.
	overloadCard := Overload new.
	accelerationCard := Acceleration new.
	repeatCard := Repeat new.
	redoCard := Redo new.
	cancellationCard := Cancellation new
]

{ #category : #asserting }
CardTest >> should: anErrorBlock raise: exceptionClass withMessage: expectedErrorMessage [

	self
		should: anErrorBlock
		raise: exceptionClass
		withExceptionDo:
			[ :error | self assert: error messageText equals: expectedErrorMessage ]
]

{ #category : #tests }
CardTest >> testAGamePlayerPlaysCardNotInHand [

	| aGame aDie aBoard aDice |
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1
		usingDeck: Deck onlyOverloadCards .
	self
		should: [ aGame speedCardUsedBy: player1 targetting: player2. ]
		raise: Error
		withMessage: 'The player does not have that card'
]

{ #category : #tests }
CardTest >> testAGameWithACancellationAndNoActiveCards [

	| aGame aDie aBoard aDice aLeader |
	player1 drawCardFrom: speedDeck.
	player1 drawCardFrom: cancellationDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	self
		should: [ aGame cancellationCardUsedBy: player1 targetting: player2 removing: speedCard .]
		raise: Error
		withMessage: 'Cant play cancellation with no active cards in game'.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 4
]

{ #category : #tests }
CardTest >> testAGameWithASpeedCard [

	| aGame aDie aBoard aDice aLeader |
	player1 drawCardFrom: speedDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame speedCardUsedBy: player1 targetting: player1.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithASpeedCardAndCancellation [

	| aGame aDie aBoard aDice aLeader |
	player1 drawCardFrom: speedDeck.
	player1 drawCardFrom: cancellationDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame speedCardUsedBy: player1 targetting: player1.
	aGame cancellationCardUsedBy: player1 targetting: player1 removing: speedCard.
	aGame moveCurrentPlayer.
	aLeader := aGame leaderPosition.
	self assert: aLeader equals: 4
]

{ #category : #tests }
CardTest >> testAGameWithAnAccelerationCard [

	| aGame aDie aBoard aDice allPlayers |
	player1 drawCardFrom: accelerationDeck.
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame accelerationCardUsedBy: player1.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player2) equals: 5
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectAtomicBomb [

	| aGame aDie aBoard aDice aLeaderPosition someSlots |
	player2 drawCardFrom: repeatDeck.
	aDie := LoadedDie rolling: 8.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withAtomicBomb}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2.
			player3}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	aGame moveCurrentPlayer.
	aGame repeatCardUsedBy: player2 targetting: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectMoonwalk [

	| aGame aDie aBoard aDice someSlots |
	player2 drawCardFrom: repeatDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: { aDie }.
	someSlots := { 
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withNoEffect.
		             BoardSlot withMoonwalkWithFixedValue.
		             BoardSlot withNoEffect }.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		         playedBy: { 
				         player1.
				         player2 }
		         usingDice: aDice
		         playedOn: aBoard
		         finishingAtLap: 2.

	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 4.
	self assert: (aGame currentSlotOf: player2) equals: 0.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 4.
	self assert: (aGame currentSlotOf: player2) equals: 4.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 8.
	self assert: (aGame currentSlotOf: player2) equals: 2.
	aGame repeatCardUsedBy: player2 targetting: player1.
	self assert: (aGame currentSlotOf: player1) equals: 8.
	self assert: (aGame currentSlotOf: player2) equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectSpeedUp [

	| aGame aDie aBoard aDice aLeaderPosition someSlots |
	player2 drawCardFrom: repeatDeck.
	aDie := LoadedDie rolling: 3.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withWormHole.
	BoardSlot withSpeedUp.
	BoardSlot withMoonwalkWithFixedValue.
	BoardSlot withAtomicBomb.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	aGame moveCurrentPlayer.
	aGame repeatCardUsedBy: player2 targetting: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 11
]

{ #category : #tests }
CardTest >> testAGameWithAnInstantRepeatCardWithLastEffectWormHole [

	| aGame aDie aBoard aDice aLeaderPosition someSlots |
	player2 drawCardFrom: repeatDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	someSlots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withWormHole}.
	aBoard := Board withAll: someSlots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 2.
	3 timesRepeat: [ aGame moveCurrentPlayer ].
	aGame repeatCardUsedBy: player2 targetting: player1.
	aLeaderPosition := aGame leaderPosition.
	self assert: aLeaderPosition equals: 4.
	self assert: (aGame currentSlotOf: player1) equals: 0
]

{ #category : #tests }
CardTest >> testAGameWithAnOverloadCard [

	| aGame aDie aBoard aDice |
	player1 drawCardFrom: overloadDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame overloadCardUsedBy: player1 targetting: player1.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 4
]

{ #category : #tests }
CardTest >> testAGameWithAnOverloadCardOnTwoPlayers [

	| aGame aDie aBoard aDice |
	player1 drawCardFrom: overloadDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	self
		should: [ aGame overloadCardUsedBy: player1 targetting: {player1.player2}. ]
		raise: Error
		withMessage: 'This card can only be played on 1 player'.
]

{ #category : #tests }
CardTest >> testAGameWithAnSpeedCardOnTwoPlayers [

	| aGame aDie aBoard aDice |
	player1 drawCardFrom: speedDeck .
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	self
		should: [ aGame speedCardUsedBy: player1 targetting: {player1.player2} ]
		raise: Error
		withMessage: 'This card can only be played on 1 player'.
]

{ #category : #tests }
CardTest >> testAGameWithDoubleRedoAnAcceleration [
	| aGame aDie aBoard aDice allPlayers |
	player1 drawCardFrom: accelerationDeck.
	player1 drawCardFrom: redoDeck.
	player1 drawCardFrom: redoDeck.
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 20.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame accelerationCardUsedBy: player1.
	aGame redoCardUsedBy: player1.
	aGame redoCardUsedBy: player1.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 7.
	self assert: (aGame currentSlotOf: player2) equals: 7
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnAcceleration [

	| aGame aDie aBoard aDice allPlayers |
	player1 drawCardFrom: accelerationDeck.
	player1 drawCardFrom: redoDeck.
	allPlayers := {player1.
	player2}.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 20.
	aGame := BigTalkGame
		playedBy: allPlayers
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame accelerationCardUsedBy: player1.
	aGame redoCardUsedBy: player1.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 6.
	self assert: (aGame currentSlotOf: player2) equals: 6
]

{ #category : #tests }
CardTest >> testAGameWithRedoAnOverload [

	| aGame aDie aBoard aDice |
	player1 drawCardFrom: overloadDeck.
	player1 drawCardFrom: redoDeck.
	aDie := LoadedDie rolling: 4.
	aDice := Dice with: {aDie}.
	aBoard := Board sizedWithNoEffects: 6.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1.
	aGame overloadCardUsedBy: player1 targetting: player1.
	aGame redoCardUsedBy: player1 targetting: player2.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 2
]

{ #category : #tests }
CardTest >> testDefaultDeckHandsAllCards [

	| aDeck aSet |
	aDeck := Deck default.
	aSet := Set new.
	1 to: 100 do: [ :iter | aSet add: aDeck draw ].
	self assert: (aSet size) equals: 6.
]

{ #category : #tests }
CardTest >> testDefaultDeckWithOnlySomeCardTypes [

	| aDeck aSet |
	aDeck := Deck using: { 
			         speedCard.
			         overloadCard.
			         accelerationCard }.
	aSet := Set new.
	1 to: 100 do: [ :iter | aSet add: aDeck draw ].
	self assert: (aSet occurrencesOf: speedCard) equals: 1.
	self assert: (aSet occurrencesOf: overloadCard) equals: 1.
	self assert: (aSet occurrencesOf: accelerationCard) equals: 1
]

{ #category : #tests }
CardTest >> testPlayerApplyACardAtBeginning [

	| aGame aDie aBoard aDice slots |
	aDie := LoadedDie rolling: 2.
	aDice := Dice with: {aDie}.
	slots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withGrabCard.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: slots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1
		usingDeck: speedDeck .
	aGame speedCardUsedBy: player1 targetting: player2. 
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 2.
	self assert: (aGame currentSlotOf: player2) equals: 3.
]

{ #category : #tests }
CardTest >> testPlayerCantPlayPermanentCardsOutsideTurn [

	| aGame aDie aBoard aDice slots |
	aDie := LoadedDie rolling: 2.
	aDice := Dice with: {aDie}.
	slots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: slots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1
		usingDeck: Deck onlySpeedCards.
	aGame moveCurrentPlayer.
	self
		should: [ aGame speedCardUsedBy: player1 targetting: player2 ]
		raise: Error
		withMessage: 'Players can only play permanent cards during their turn'.

]

{ #category : #tests }
CardTest >> testPlayerFallsOnGrabCardGrabsSpeed [

	| aGame aDie aBoard aDice slots |
	aDie := LoadedDie rolling: 2.
	aDice := Dice with: {aDie}.
	slots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withGrabCard.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: slots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1
		usingDeck: Deck onlySpeedCards.
	aGame speedCardUsedBy: player1 targetting: player2.
	aGame speedCardUsedBy: player1 targetting: player2.
	self
		should: [ aGame speedCardUsedBy: player1 targetting: player2 ]
		raise: Error
		withMessage: 'The player does not have any cards left'.
	aGame moveCurrentPlayer.
	self
		should: [ aGame speedCardUsedBy: player1 targetting: player2  ]
		raise: Error
		withMessage: 'Players can only play permanent cards during their turn'.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	aGame speedCardUsedBy: player1 targetting: player2 .
	aGame moveCurrentPlayer.
	aGame moveCurrentPlayer.
	self assert: (aGame currentSlotOf: player1) equals: 6.
	self assert: (aGame currentSlotOf: player2) equals: 5
]

{ #category : #tests }
CardTest >> testPlayerStartsWithTwoCards [

	| aGame aDie aBoard aDice slots |
	aDie := LoadedDie rolling: 2.
	aDice := Dice with: {aDie}.
	slots := {BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withGrabCard.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect.
	BoardSlot withNoEffect}.
	aBoard := Board withAll: slots.
	aGame := BigTalkGame
		playedBy:
			{player1.
			player2}
		usingDice: aDice
		playedOn: aBoard
		finishingAtLap: 1
		usingDeck: speedDeck .
	aGame speedCardUsedBy: player1 targetting: player2.
	aGame speedCardUsedBy: player1 targetting: player2.
	self
		should: [ aGame speedCardUsedBy: player1 targetting: player2]
		raise: Error
		withMessage: 'The player does not have any cards left'.
]
