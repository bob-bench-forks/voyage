system primitives
doesNotUnderstand: aMessage 
	| realObject |
	
	realObject := self obtainRealObject.
	realObject ifNil: [
		(repository descriptionBuilder for: objectClass) isAllowMissingContent
			ifTrue: [ 
				realObject := VOMissingObject class: objectClass id: objectId ]
			ifFalse: [ 
				VOError signal: ('Lazy reference not found {1}: {2}' format: {objectClass name. objectId}) ] ].
	
	self becomeForwardKeepingHash: realObject.
	^realObject
		perform: aMessage selector 
		withArguments: aMessage arguments.