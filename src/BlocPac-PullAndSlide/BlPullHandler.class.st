"
I add an ability to drag (pull) any arbitrary element within its direct parent by requesting position change.
Note, that some layout do not allow elements to have custom positions which means I have no effect.

Example:

```
| element |

element := BlElement new.
element background: Color red.
element size: 75@75.
element addEventHandler: BlPullHandler new.	
```

"
Class {
	#name : #BlPullHandler,
	#superclass : #BlCustomEventHandler,
	#instVars : [
		'dragStartGlobalPosition',
		'originalPosition',
		'allowedOutOfBounds',
		'direction',
		'pullTarget'
	],
	#classVars : [
		'Any',
		'Horizontal',
		'Vertical'
	],
	#category : #'BlocPac-PullAndSlide-Handlers'
}

{ #category : #'class initialization' }
BlPullHandler class >> initialize [	
	Any := #any.
	Vertical := #vertical.
	Horizontal := #horizontal
]

{ #category : #'api - pull handler' }
BlPullHandler >> allowOutOfBounds [
	"Allow the pulled element to be pulled outside of the parent bounds"
	
	allowedOutOfBounds := true
]

{ #category : #'api - pull handler' }
BlPullHandler >> beFree [
	direction := Any
]

{ #category : #'api - pull handler' }
BlPullHandler >> beHorizontal [
	direction := Horizontal
]

{ #category : #'api - pull handler' }
BlPullHandler >> beVertical [
	direction := Vertical
]

{ #category : #'private - pulling' }
BlPullHandler >> computePullDelta: aDragDelta [
	<return: #Number>
	
	direction = Any
		ifTrue: [ ^ aDragDelta ].
		
	direction = Vertical
		ifTrue: [ ^ 0 @ aDragDelta y ].
		
	direction = Horizontal
		ifTrue: [ ^ aDragDelta x @ 0 ].
		
	^ direction
]

{ #category : #'api - pull handler' }
BlPullHandler >> disallowOutOfBounds [
	"Do not allow the pulled element to be pulled outside of the parent bounds"
	
	allowedOutOfBounds := false
]

{ #category : #'event handling' }
BlPullHandler >> dragEndEvent: anEvent [
	"anEvent consumed: true."
	
	pullTarget dispatchEvent: BlPullEndEvent new
]

{ #category : #'event handling' }
BlPullHandler >> dragEvent: anEvent [
	| aStartPosition aCurrentPosition aPreviousPosition dragDelta aNewPosition |
		
	dragStartGlobalPosition ifNil: [ dragStartGlobalPosition := anEvent position ].
	
	aCurrentPosition := pullTarget globalPointToParentChildren: anEvent position.
	aStartPosition := pullTarget globalPointToParentChildren: dragStartGlobalPosition.

	dragDelta := aCurrentPosition - aStartPosition.
	
	dragDelta := (self computePullDelta: dragDelta) rounded.
	
	aNewPosition := ((originalPosition ifNil: [ originalPosition := pullTarget constraints position ]) + dragDelta).
	aPreviousPosition := pullTarget constraints position.

	allowedOutOfBounds ifFalse: [
		| aMaxPosition |

		aMaxPosition := (pullTarget hasParent
			ifTrue: [ pullTarget parent extent - anEvent currentTarget extent ]
			ifFalse: [ 0@0 ]).
		aNewPosition := aNewPosition min: aMaxPosition max: 0@0 ].
	pullTarget enqueueTask: (BlTaskAction new action: [ pullTarget relocate: aNewPosition ]).
	anEvent consumed: true.
	
	self
		onPulled: pullTarget
		from: aPreviousPosition
		to: aNewPosition
		by: dragDelta
		starting: originalPosition
]

{ #category : #'event handling' }
BlPullHandler >> dragStartEvent: anEvent [

	anEvent consumed: true.

	pullTarget := pullTarget ifNil: [ anEvent currentTarget ].
	pullTarget dispatchEvent: BlPullStartEvent new.

	"drag start position in space coordinates"
	dragStartGlobalPosition := anEvent position.

	"element position in parent"
	originalPosition := pullTarget constraints position
]

{ #category : #'api - accessing' }
BlPullHandler >> eventsToHandle [
	^ { BlDragStartEvent . BlDragEvent . BlDragEndEvent }
]

{ #category : #initialization }
BlPullHandler >> initialize [
	super initialize.
	
	allowedOutOfBounds := true.
	direction := Any
]

{ #category : #'event handling' }
BlPullHandler >> onPulled: aPulledElement from: aPreviousPosition to: aNewPosition  by: aDragDelta starting: anOriginalPosition [
	aPulledElement dispatchEvent: (BlPullEvent new
		initialPosition: anOriginalPosition;
		oldPosition: aPreviousPosition;
		newPosition: aNewPosition;
		delta: aDragDelta)
]

{ #category : #accessing }
BlPullHandler >> pullTarget [

	^ pullTarget 
]

{ #category : #accessing }
BlPullHandler >> pullTarget: anElement [

	pullTarget := anElement 
]
