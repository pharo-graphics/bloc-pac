Extension { #name : #BlSvgPathBuilder }

{ #category : #'*BlocPac-Extensions' }
BlSvgPathBuilder >> gtCommandsFor: aView [
	<gtView>

	^ aView columnedList
		title: 'Commands';
		priority: 2;
		items: [ self commands associations ];
		column: 'Letter' item: [ :each | each key ];
		column: 'Command' item: [ :each | each value ];
		send: #value
]

{ #category : #'*BlocPac-Extensions' }
BlSvgPathBuilder >> gtSegmentsFor: aView [
	<gtView>

	^ aView list
		title: 'Segments';
		priority: 1;
		items: [ self segments ]
]
