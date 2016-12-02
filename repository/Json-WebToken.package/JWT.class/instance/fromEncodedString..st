initialize-release
fromEncodedString: aString
	| segments headerString payloadString signatureString |
	
	segments := aString subStrings: '.'.
	(segments size = 2 or:[segments size = 3])
		ifFalse:[self error:'Too many or not enough segments'].
		
	headerString := (self base64UrlDecoded: segments first) convertFromEncoding: 'utf-8'.
	payloadString := (self base64UrlDecoded: segments second) convertFromEncoding: 'utf-8'.
	[headerfields := JSJsonParser parse: headerString.
	 payload := JSJsonParser parse: payloadString]
		on: JSJsonSyntaxError do:[:e | self error: 'Incorrect string encoding or invalid json content'].
		
	segments size = 3 ifTrue:[
		signatureString := self base64UrlDecoded: segments third.
		self verifySignature: signatureString forMessage: segments first,'.',segments second.
		]