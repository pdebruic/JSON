*JSON-writing
jsonWriteOn: aStream
	self key asStringForJson jsonWriteOn: aStream.
	aStream nextPut: $:; space.
	self value jsonWriteOn: aStream.