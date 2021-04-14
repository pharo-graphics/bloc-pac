Extension { #name : #XMLOrderedList }

{ #category : #'*BlocPac-SVG' }
XMLOrderedList >> at: anIndex ifPresent: aBlock [
	collection at: anIndex ifAbsent: [ ^self ].
	^aBlock
]
