tests
testSaveWithClasses
	self repository save: (VOTestPilot new currency: VOTestEuro).
	self waitForWriteOperation.
	
	self 
		assert: (self repository selectAll: VOTestPilot) anyOne currency 
		equals: VOTestEuro.
	