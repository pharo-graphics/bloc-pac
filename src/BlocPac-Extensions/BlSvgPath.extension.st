Extension { #name : #BlSvgPath }

{ #category : #'*BlocPac-Extensions' }
BlSvgPath >> gtSegmentsFor: aView [
	<gtView>
	^ aView list
		title: 'Segments';
		items: [segments]
]
