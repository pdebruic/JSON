private
base64UrlDecoded: aString
	^ ((aString copyReplaceAll: '-' with:  '+') copyReplaceAll: '_' with: '/') base64Decoded.