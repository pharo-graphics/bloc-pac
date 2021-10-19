Class {
	#name : #BlTktPreservingResultCommand,
	#superclass : #BlTktDecoratedCommand,
	#instVars : [
		'result',
		'hasResult'
	],
	#category : #'BlocPac-Tasker-Commands'
}

{ #category : #converting }
BlTktPreservingResultCommand >> asResultPreservingCommand [
	<return: #BlTktPreservingResultCommand>
	^ self
]

{ #category : #evaluating }
BlTktPreservingResultCommand >> execute [
	"Execute command and return a result"

	hasResult ifFalse: [
		result := self command execute.
		hasResult := true ].
	^ result
]

{ #category : #accessing }
BlTktPreservingResultCommand >> hasResult [
	<return: #Boolean>
	^ hasResult
]

{ #category : #initialization }
BlTktPreservingResultCommand >> initialize [
	super initialize.
	hasResult := false.
	result := nil.
]

{ #category : #accessing }
BlTktPreservingResultCommand >> name [
	<return: #String>
	^ 'Preserving result ', self name
]

{ #category : #accessing }
BlTktPreservingResultCommand >> result [
	^ result
]
