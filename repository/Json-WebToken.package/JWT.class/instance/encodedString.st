accessing
encodedString
	| content signature |
	content := self base64UrlEncoded: (headerfields asJson convertToEncoding: 'utf-8'). 
	content := content,'.',(self base64UrlEncoded: (payload asJson convertToEncoding: 'utf-8')).
	signature := self base64UrlEncoded: (self signatureOf: content).

	^ content , '.', signature.