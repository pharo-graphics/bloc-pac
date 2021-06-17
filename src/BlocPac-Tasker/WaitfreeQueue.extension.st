Extension { #name : #WaitfreeQueue }

{ #category : #'*BlocPac-Tasker' }
WaitfreeQueue >> contents [ 
	"Answer all objects.
	Provided for compatibility with SharedPriorityUniqueQueue"

	^(self itemArray
		reject: [ :each | each isZombie ])
			collect: [ :item | item object ].

]

{ #category : #'*BlocPac-Tasker' }
WaitfreeQueue >> itemArray [
	"Answer an array of the receiver's items, excluding the dummy"

	| item |

	item := dummy.
	^Array streamContents: [ :stream |
		[ item := item next.
		stream nextPut: item.
		item isCircular ] whileFalse ].
]
