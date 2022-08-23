"
# Vertical line

Draws a vertical line from the current point (cpx, cpy) to (cpx, y). V (uppercase) indicates that absolute coordinates will follow; v (lowercase) indicates that relative coordinates will follow. Multiple y values can be provided (although usually this doesn't make sense). At the end of the command, the new current point becomes (cpx, y) for the final value of y.

"
Class {
	#name : #BlSvgPathVerticalLineSegment,
	#superclass : #BlSvgPathSegment,
	#instVars : [
		'lineY'
	],
	#category : #'BlocPac-Geometry-SVG'
}

{ #category : #comparing }
BlSvgPathVerticalLineSegment >> = anotherObject [

	self == anotherObject ifTrue: [ ^ true ].
	self class = anotherObject class ifFalse: [ ^ false ].

	^ isAbsolute = anotherObject isAbsolute and: [ 
		  lineY = anotherObject lineY ]
]

{ #category : #executing }
BlSvgPathVerticalLineSegment >> executeOn: aBuilder [
	self isAbsolute
		ifTrue: [ aBuilder lineTo: aBuilder currentPoint x @ self lineY ]
		ifFalse: [ aBuilder lineTo: 0 @ self lineY ]
]

{ #category : #comparing }
BlSvgPathVerticalLineSegment >> hash [
	"Answer an integer value that is related to the identity of the receiver."

	^ lineY hash bitXor: isAbsolute hash
]

{ #category : #initialization }
BlSvgPathVerticalLineSegment >> initialize [
	super initialize.
	
	lineY := 0
]

{ #category : #accessing }
BlSvgPathVerticalLineSegment >> lineY [
	^ lineY
]

{ #category : #accessing }
BlSvgPathVerticalLineSegment >> lineY: anObject [
	lineY := anObject
]

{ #category : #printing }
BlSvgPathVerticalLineSegment >> printOn: aStream [
	aStream
		nextPutAll: 'Vertical line ';
		nextPutAll: self printAbsolute;
		nextPutAll: ' to ';
		printOn: self lineY
]
