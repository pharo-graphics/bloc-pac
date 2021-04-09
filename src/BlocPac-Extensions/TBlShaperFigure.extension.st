Extension { #name : #TBlShaperFigure }

{ #category : #'*BlocPac-Extensions' }
TBlShaperFigure >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 5;
		stencil: [
			BlElement new
				constraintsDo: [ :c |
					c horizontal matchParent.
					c vertical matchParent ];
				geometry: (BlPolygon vertices: (self vertices collect: #point));
				border: (BlBorder paint: Color gray width: 2) ]
]
