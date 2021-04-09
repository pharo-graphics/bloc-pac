Extension { #name : #BlTaskSignalAnalysis }

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtCurrentProcessFor: aView [
	"Display Tasks that take longer than triggerDuration"
	<gtView>
	^ aView columnedList
		title: 'Current Process' translated;
		priority: 40;
		items: [ self getCurrentProcessSignals ];
		column: 'Signal' translated item: [ :each | each asString ]
]

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtRecordingsFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Recordings' translated;
		priority: 50;
		items: [ self recordings reverse ];
		column: 'Timestamp' translated item: [ :each | each timestamp asString ];
		column: 'Process' translated item: [ :each | each processId asString ];
		column: 'Type' translated item: [ :each | each name ];
		column: 'Contents' translated item: [ :each | 
			String streamContents: [ :s | each printOneLineContentsOn: s ] ]
]

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtSlowFor: aView [
	"Display Tasks that take longer than triggerDuration"
	<gtView>
	^ aView columnedList
		title: 'Slow Tasks' translated;
		priority: 40;
		items: [ self slow ];
		column: 'Duration' translated item: [ :each | each first asString ];
		column: 'Target' translated item: [ :each | each second target asString ]
]

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtSlowPulsesFor: aView [
	"Display Tasks that take longer than triggerDuration"
	<gtView>
	^ aView columnedList
		title: 'Pulses' translated;
		priority: 40;
		items: [ self getSlowPulses ];
		column: 'Signal' translated item: [ :each | each asString ]
]

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtSummaryFor: aView [
	"Display the summary text"
	<gtView>
	^ aView textEditor
		title: 'Summary' translated;
		priority: 1;
		text: [ self summaryText ]
]

{ #category : #'*BlocPac-Extensions' }
BlTaskSignalAnalysis >> gtUnfinishedFor: aView [
	<gtView>
	^ aView columnedList
		title: 'Unfinished' translated;
		priority: 45;
		items: [ self unfinished reverse ];
		column: 'Timestamp' translated item: [ :each | each timestamp asString ]
		column: 'Process' translated item: [ :each | each processId asString ]
		column: 'Type' translated item: [ :each | each name ];
		column: 'Contents' translated item: [ :each | 
			String streamContents: [ :s | each printOneLineContentsOn: s ] ]
]
