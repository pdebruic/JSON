testing jwt encoding
testEncodingDecodingNonASCII

	|  key token1 token2 token3 token4 token5 |

	key := 'secret'.

	"Tests decoding of a known example of a JSON web token with the following payload string (including the spaces) which
	  contains a non-ASCII character:
		'{ ""name"" : ""Ægir"" }' "
	token1 := JWT new key: key; fromEncodedString: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyAibmFtZSIgOiAiw4ZnaXIiIH0.YMQaox/praqN23QnH/RYPyPoRvEr/IDshYCjc3XvMWw'.
	self assert: token1 payload = (JSJsonParser parse: '{ "name" : "Ægir" }').

	"Tests whether encoding and decoding works for a payload containing a non-ASCII character (note that the #encodedString for
		these tokens may or may not be the same as that of token1, depending on how the payload object is converted to a string by #asJson):"
	token2 := JWT new key: key; payload: (Dictionary with: 'name' -> 'Ægir'); yourself.
	token3 := JWT new key: key; fromEncodedString: token2 encodedString.	
	self assert: token3 payload = token3 payload.
	
	"Tests whether encoding and decoding works for a payload containing non-Basic Multilingual Plane characters using the name 'LOGI'
		written out using the squared latin capital letters of code points U+1F130 through U+1F149:"
	token4 := JWT new key: key; payload: (Dictionary with: 'name' -> (#(16r1F13B 16r1F13E 16r1F136 16r1F138) collect: [ :cp | Character codePoint: cp ] as: String)).
	token5 := JWT new key: key; fromEncodedString: token4 encodedString.
	self assert: token4 payload = token5 payload.