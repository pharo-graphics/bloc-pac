"
I allow users to add a special drawing and layout offset to specific item elements from the data set. This can be useful for drawing dividers between items, highlights, visual grouping boundaries and more.

"
Class {
	#name : #BlInfiniteDecoration,
	#superclass : #Object,
	#category : #'BlocPac-Infinite-Basic'
}

{ #category : #drawing }
BlInfiniteDecoration >> draw: anItemElement onSpartaCanvas: aSpartaCanvas in: anInfiniteElement [

	"Draw any appropriate decorations into the Sparta Canvas supplied to the Infinite Element for its child element anItemElement. Any content drawn by this method will be drawn before the item elements are drawn, and will thus appear underneath them"

	
]

{ #category : #drawing }
BlInfiniteDecoration >> draw: anItemElement onSpartaCanvasOver: aSpartaCanvas in: anInfiniteElement [

	"Draw any appropriate decorations into the Sparta Canvas supplied to the Infinite Element for its child element anItemElement. Any content drawn by this method will be drawn after the item elements are drawn, and will thus appear over them"

	
]

{ #category : #drawing }
BlInfiniteDecoration >> drawOnSpartaCanvas: aSpartaCanvas in: anInfiniteElement [

	"Draw any appropriate decorations into the Sparta Canvas supplied to the Infinite Element. Any content drawn by this method will be drawn before the item elements are drawn, and will thus appear underneath them"

	anInfiniteElement children sortedByElevation do: [ :child | 
		self draw: child onSpartaCanvas: aSpartaCanvas in: anInfiniteElement ].

]

{ #category : #drawing }
BlInfiniteDecoration >> drawOnSpartaCanvasOver: aSpartaCanvas in: anInfiniteElement [

	"Draw any appropriate decorations into the Sparta Canvas supplied to the Infinite Element. Any content drawn by this method will be drawn after the item elements are drawn, and will thus appear over them"
	anInfiniteElement children sortedByElevation do: [ :child | 
		self draw: child onSpartaCanvasOver: aSpartaCanvas in: anInfiniteElement ].

]

{ #category : #geometry }
BlInfiniteDecoration >> itemInsets: aBlInsets of: anItemElement in: anInfiniteElement [
	"Retrieve any offsets for the given item element.
	If this ItemDecoration does not affect the positioning of item element, it should return the argument aBlInsets"
	<return: #BlInsets>
	
	^ aBlInsets
]

{ #category : #updating }
BlInfiniteDecoration >> updateFrom: anInfiniteElement [
]
