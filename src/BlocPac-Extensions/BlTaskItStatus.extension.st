Extension { #name : #BlTaskItStatus }

{ #category : #'*BlocPac-Extensions' }
BlTaskItStatus >> gtStatusFor: aView [
	<gtView>

	^aView textEditor 
		title: 'Status' translated;
		priority: 1;
		aptitude: BrGlamorousCodeEditorAptitude;
		text: [ self statusString asRopedText ]
]
