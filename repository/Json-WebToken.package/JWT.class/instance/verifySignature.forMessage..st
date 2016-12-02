private
verifySignature: signatureString forMessage: messageString
	signatureString = (self signatureOf: messageString)
		ifFalse:[self error: 'Signature verification failed']