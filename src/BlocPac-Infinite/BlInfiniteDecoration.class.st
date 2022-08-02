"
I allow users to add a special drawing and layout offset to specific item elements from the data set. This can be useful for drawing dividers between items, highlights, visual grouping boundaries and more.

"
Class {
	#name : #BlInfiniteDecoration,
	#superclass : #Object,
	#instVars : [
		'computedBounds',
		'decorationInsets',
		'priority'
	],
	#category : #'BlocPac-Infinite-Basic'
}

{ #category : #geometry }
BlInfiniteDecoration >> computedBounds [ 
	^ computedBounds
]

{ #category : #geometry }
BlInfiniteDecoration >> decorationInsets [
	"get the insets for the given item element. Be aware that only one side is used"
	<return: #BlInsets>
	
	^ decorationInsets 
]

{ #category : #geometry }
BlInfiniteDecoration >> decorationInsetsOfChildElement: anElement [
	"get the insets for the given item element. Be aware that only one side is used"
	<return: #BlInsets>
	
	^ decorationInsets := self requiredInsetsOfChildElement: anElement
]

{ #category : #updating }
BlInfiniteDecoration >> onLayoutDoneIn: anEditorElement remaining: remainingRectangle [

	| insets rbnds |
	insets := self decorationInsets.
	rbnds := remainingRectangle.
	insets left isZero ifFalse: [ | insetsLeft |
		insetsLeft := insets left .
		computedBounds := rbnds origin corner: rbnds left + insetsLeft @ rbnds bottom.
		^ rbnds left + insetsLeft @ rbnds top extent: rbnds extent ].
	insets top isZero ifFalse: [ 
		^ rbnds left @ rbnds top + insets top corner: rbnds corner ].
	insets right isZero ifFalse: [ | insetsRight |
		insetsRight := insets right + anEditorElement border width.
		computedBounds := rbnds right - insetsRight @ rbnds top corner: rbnds corner.
		^ rbnds origin corner: rbnds right - insetsRight @ rbnds bottom ].
	insets bottom isZero ifFalse: [ ^ rbnds origin corner: rbnds corner right @ rbnds bottom - insets bottom ]
]

{ #category : #updating }
BlInfiniteDecoration >> onScrollDoneIn: anEditorElement [
]

{ #category : #accessing }
BlInfiniteDecoration >> priority [
	^ priority ifNil: [ priority := 0 ]
	
]

{ #category : #accessing }
BlInfiniteDecoration >> priority: anInteger [
	priority := anInteger
	
]

{ #category : #geometry }
BlInfiniteDecoration >> requiredInsetsOfChildElement: anElement [
	"get the insets for the given item element. Be aware that only one side is used"
	<return: #BlInsets>
	
	^ BlInsets all: 0
]
