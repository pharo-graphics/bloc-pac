Extension { #name : #XMLElement }

{ #category : #'*BlocPac-SVG' }
XMLElement >> attributeAt: aName ifPresent: aBlock [
	"returns the value of the attribute whose full name matches aName or the
	value of aBlock if there isn't any"
	| aValue |
	aValue := self attributeNodes
		attributeValueAt: aName
		ifAbsent: [ ^ self ].
	aBlock cull: aValue
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> inheriteAttributes [
	self isRoot ifTrue: [ ^ self ].
	
	self parent attributeNamesAndValuesDo: [ :key :value | 
			(self shouldInheriteAttribute: key)
				ifTrue: [ self attributeAt: key ifAbsentPut: value ] ].
			
	self inheriteTransformAttribute.
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> inheriteTransformAttribute [
	self parent attributeAt: 'transform' ifAbsent: [ ^ self ].
	
	self attributeAt: 'transform' put: (self parent attributeAt: 'transform') , self transformAttribute
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> shouldBeAddedToParent [
	^ {'svg' . 'g' . 'use' . 'rect' . 'circle' . 'ellipse' . 'line' . 'polyline' . 'polygon' . 'path' . 'text' . 'tspan' . 'image'} includes: self name
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> shouldInheriteAttribute: key [
	"Note that the 'transform' attribute will still be inherited but through a special way."

	^ ({'transform' . 'display' . 'x' . 'y' . 'height' . 'width' . 'id' . 'opacity'} includes: key) not
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> splitStyleAttribute [
	self attributeAt:'style' ifAbsent:[^self].
	
	((self attributeAt:'style') substrings: ';') do: [:keyAndVal |
			self attributeAt: (keyAndVal copyUpTo: $:) trimBoth put: (keyAndVal copyAfter: $:) trimBoth].

]

{ #category : #'*BlocPac-SVG' }
XMLElement >> transformAttribute [
	self attributeAt: 'transform' ifAbsent: [ ^'' ].
	^self attributeAt: 'transform'
]

{ #category : #'*BlocPac-SVG' }
XMLElement >> translatedBy: aSVGFactory withParent: parentElement [
	| translatedElement |
	translatedElement := aSVGFactory generateElementFrom: self.
	self shouldBeAddedToParent
		ifTrue: [ parentElement addChild: translatedElement ].
	^ translatedElement
]
