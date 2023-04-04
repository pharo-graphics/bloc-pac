Class {
	#name : #BlScrollableElementEventHandler,
	#superclass : #BlEventListener,
	#category : #'BlocPac-Scrollable-Core'
}

{ #category : #'mouse handlers' }
BlScrollableElementEventHandler >> mouseWheelEvent: anEvent [
	| aScrollHappened |
	
	"I implement touch support, so ignore fake mouse wheel events"
	anEvent isTouch
		ifTrue: [ ^ self ].

	aScrollHappened := anEvent currentTarget scrollBy: (anEvent vector * 20) negated.
	anEvent consumed: aScrollHappened
]
