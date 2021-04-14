Extension { #name : #TSpartaPathBuilder }

{ #category : #'*BlocPac-SVG' }
TSpartaPathBuilder >> ellipticalArc: radii xrot: rotationAxis large: largeFlag sweep: sweepFlag to: aPoint [
	self explicitRequirement
]

{ #category : #'*BlocPac-SVG' }
TSpartaPathBuilder >> reflectedCurveTo: aPoint [
	self explicitRequirement
]

{ #category : #'*BlocPac-SVG' }
TSpartaPathBuilder >> reflectedCurveVia: aPoint to: anotherPoint [
	self explicitRequirement
]
