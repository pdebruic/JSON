private
base64UrlEncoded: aString
	| charsToRemove |
	charsToRemove := (String with: Character cr with: Character lf with: $=).
	^ ((aString base64Encoded copyReplaceAll: '+' with:  '-') copyReplaceAll: '/' with: '_') reject:[:c | charsToRemove includes: c].