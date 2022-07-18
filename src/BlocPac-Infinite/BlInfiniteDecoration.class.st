"
I allow users to add a special drawing and layout offset to specific item elements from the data set. This can be useful for drawing dividers between items, highlights, visual grouping boundaries and more.

"
Class {
	#name : #BlInfiniteDecoration,
	#superclass : #Object,
	#category : #'BlocPac-Infinite-Basic'
}

{ #category : #geometry }
BlInfiniteDecoration >> itemInsets: aBlInsets of: anItemElement in: anInfiniteElement [
	"Retrieve any offsets for the given item element.
	If this ItemDecoration does not affect the positioning of item element, it should return the argument aBlInsets"
	<return: #BlInsets>
	
	^ aBlInsets
]

{ #category : #updating }
BlInfiniteDecoration >> onLayoutDoneIn: anEditorElement [
]

{ #category : #updating }
BlInfiniteDecoration >> onScrollDoneIn: anEditorElement [
]
