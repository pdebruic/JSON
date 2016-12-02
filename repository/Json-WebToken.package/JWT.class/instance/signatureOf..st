private
signatureOf: aString
	|algo|
	algo := headerfields at: 'alg'.
	
	algo = 'none' ifTrue:[
		^ ''
		].
	
	algo = 'HS256' ifTrue:[	
		^ ((SHA256 new hmac)
			key: key asByteArray;
			digestMessage: aString asByteArray) asString
		].
	
	self error: 'Unsupported signing method'