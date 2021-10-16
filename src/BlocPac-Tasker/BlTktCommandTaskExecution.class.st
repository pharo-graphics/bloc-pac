Class {
	#name : #BlTktCommandTaskExecution,
	#superclass : #TKTTaskExecution,
	#traits : 'TBlDebug',
	#classTraits : 'TBlDebug classTrait',
	#category : #'BlocPac-Tasker-TaskIt Tasks'
}

{ #category : #evaluating }
BlTktCommandTaskExecution >> doExecuteTask [

	task ifNil: [ ^ nil ].

	^ [ super doExecuteTask ] 
		on: BlTktExplicitlyTerminatedTaskException
		do: [ :anException | 
			BlTaskItExplicitlyTerminatedCommandSignal emitValuable: task message: #commandTerminated.
			nil ]
]
