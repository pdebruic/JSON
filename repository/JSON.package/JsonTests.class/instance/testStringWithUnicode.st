as yet unclassified
testStringWithUnicode

	| unicodeString |
	unicodeString := (Character value: 16r263A) asString.
	
	self json: '"\u263A"' equals:unicodeString.
	self json: '"', unicodeString, '"' equals: unicodeString.
	self render: unicodeString equals: '"', unicodeString, '"'.