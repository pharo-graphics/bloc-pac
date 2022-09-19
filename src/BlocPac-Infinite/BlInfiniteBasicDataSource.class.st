"
I am an empty data source used by default by infinite element

"
Class {
	#name : #BlInfiniteBasicDataSource,
	#superclass : #BlInfiniteDataSource,
	#instVars : [
		'layoutPositionsRange'
	],
	#category : #'BlocPac-Infinite-DataSource'
}

{ #category : #accessing }
BlInfiniteBasicDataSource >> itemCount [
	"There are no items in empty datasource"
	<return: #Number>

	^ 0
]

{ #category : #accessing }
BlInfiniteBasicDataSource >> layoutPositionsRange: anInterval [
	layoutPositionsRange := anInterval
]
