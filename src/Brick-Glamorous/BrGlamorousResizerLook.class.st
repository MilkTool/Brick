Class {
	#name : #BrGlamorousResizerLook,
	#superclass : #BrResizerLook,
	#instVars : [
		'thickness',
		'borderSeparation'
	],
	#category : #'Brick-Glamorous-Resizer'
}

{ #category : #accessing }
BrGlamorousResizerLook >> borderSeparation [
	^ borderSeparation
]

{ #category : #accessing }
BrGlamorousResizerLook >> borderSeparation: anObject [
	borderSeparation := anObject
]

{ #category : #initialization }
BrGlamorousResizerLook >> initialize [
	super initialize.
	
	thickness := 3.
	borderSeparation := 0.
	
	self
		add:
			(BrResizerInteractiveLook new
				top: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignCenter.
							c ignored vertical alignTop.
							c margin: (BlInsets top: self borderSeparation right: 0 bottom: 0 left: 0) ] ];
				bottom: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignCenter.
							c ignored vertical alignBottom.
							c margin: (BlInsets top: 0 right: 0 bottom: self borderSeparation left: 0) ] ];
				left: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignLeft.
							c ignored vertical alignCenter.
							c margin: (BlInsets top: 0 right: 0 bottom: 0 left: self borderSeparation) ] ];
				right: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c ignored horizontal alignRight.
							c ignored vertical alignCenter.
							c margin: (BlInsets top: 0 right: self borderSeparation bottom: 0 left: 0) ] ];
				vertical: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c horizontal matchParent.
							c vertical exact: self thickness.
							c ignored horizontal weight: 0.4 ] ];
				horizontal: [ :aWidget | 
					aWidget
						constraintsDo: [ :c | 
							c horizontal exact: self thickness.
							c vertical matchParent.
							c ignored vertical weight: 0.4 ] ]).
	self
		addChangeProperty: #(widget background)
		with: [ Color gray alpha: 0.4 ].
	self
		addChangeProperty: #(widget geometry)
		with: [ BlRectangle cornerRadius: 2 ]
]

{ #category : #accessing }
BrGlamorousResizerLook >> thickness [
	^ thickness
]

{ #category : #accessing }
BrGlamorousResizerLook >> thickness: anObject [
	thickness := anObject
]
