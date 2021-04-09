Extension { #name : #BlShaperPolygon }

{ #category : #'*BlocPac-Extensions' }
BlShaperPolygon >> gtLiveFor: aView [
	<gtView>
	
	^ aView explicit
		title: 'Live';
		priority: 5;
		stencil: [
			BlElement new
				addEventHandler: BlPullHandler new;
				constraintsDo: [ :c |
					c ignoreByLayout.
					c horizontal matchParent.
					c vertical matchParent ];
				geometry: (BlPolygon vertices: (self vertices collect: #point));
				border: (BlBorder paint: Color gray width: 2) ]
]
