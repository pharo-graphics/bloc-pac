Class {
	#name : #BlTaskProcess,
	#superclass : #Process,
	#instVars : [
		'processAnnotation'
	],
	#category : #'BlocPac-Tasker-Processes'
}

{ #category : #accessing }
BlTaskProcess >> annotate: aTag with: aValue [
	self processAnnotation at: aTag put: aValue.
]

{ #category : #accessing }
BlTaskProcess >> annotation: aTag [
	^ self processAnnotation at: aTag ifAbsent: [ nil ]
]

{ #category : #accessing }
BlTaskProcess >> hasProcessAnnotations [
	^ processAnnotation notNil and: [ processAnnotation isNotEmpty ]
]

{ #category : #testing }
BlTaskProcess >> isTerminated [
	"Workaround to https://github.com/pharo-project/pharo/issues/11121"

	self flag: #todo. "Fix it"

	self isActiveProcess ifTrue: [ ^ false ].
	
	^suspendedContext isNil or: [
		suspendedContext isDead or: [
			Process
				compiledMethodAt: #endProcess
				ifPresent: [ :m | suspendedContext method == m ]
				ifAbsent: [ false ] ]]

]

{ #category : #accessing }
BlTaskProcess >> processAnnotation [
	^ processAnnotation ifNil: [ processAnnotation := WeakValueDictionary new ]
]

{ #category : #accessing }
BlTaskProcess >> task [
	^ self annotation: #task
]

{ #category : #accessing }
BlTaskProcess >> task: aValuable [
	^ self annotate: #task with: aValuable
]
