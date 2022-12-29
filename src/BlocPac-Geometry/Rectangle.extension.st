Extension { #name : #Rectangle }

{ #category : #'*BlocPac-Geometry' }
Rectangle >> asBlocFloatRectangle [
	^ self origin asFloatPoint corner: self corner asFloatPoint
]
