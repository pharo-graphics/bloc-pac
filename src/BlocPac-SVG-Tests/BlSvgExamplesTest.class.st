"
A BlSvgExamplesTest is a test class for testing the behavior of BlSvgExamples
"
Class {
	#name : #BlSvgExamplesTest,
	#superclass : #TestCase,
	#category : #'BlocPac-SVG-Tests-Examples'
}

{ #category : #tests }
BlSvgExamplesTest >> exampleSelectors [

	^ (BlSvgExamples selectorsInProtocol: 'svg - converter') 
		  copyWithoutAll: self exampleSelectorsWithErrors
]

{ #category : #tests }
BlSvgExamplesTest >> exampleSelectorsWithErrors [

	^ #( curveCubicBezier curveQuadraticBezier ellipticalArc
	     pathBatman pathTiger pathTree radialGradient symbolAndUse transformations)
]

{ #category : #tests }
BlSvgExamplesTest >> testAllExamples [

	| selectors exampleFactory |
	selectors := self exampleSelectors.
	exampleFactory := BlSvgExamples new.

	selectors do: [ :each |
		| result |
		result := exampleFactory perform: each.
		self assert: (result isKindOf: BlElement) ].
	
	self deny: selectors isEmpty.
	
"	
	selectors collect: [ :each | each -> (BlSvgExamples new perform: each) ]
"
]
