Extension { #name : #BlElementQueryGroupStepResult }

{ #category : #'*BlocPac-Extensions' }
BlElementQueryGroupStepResult >> gtResultFor: aView [
	<gtView>
	self result ifNil: [ ^ aView empty ].
	^ aView list
		title: 'Result';
		priority: 10;
		items: [ self result ]
]
