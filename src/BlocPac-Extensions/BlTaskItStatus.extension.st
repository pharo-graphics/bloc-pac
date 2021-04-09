Extension { #name : #BlTaskItStatus }

{ #category : #'*BlocPac-Extensions' }
BlTaskItStatus >> gtStatusFor: aView [
	<gtView>

	^aView textEditor 
		title: 'Status' translated;
		priority: 1;
		look: BrGlamorousCodeEditorLook;
		text: [ self statusString asRopedText ]
]
