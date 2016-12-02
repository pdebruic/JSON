initialize-release
initialize
	super initialize.
	headerfields := Dictionary new.
	headerfields at: 'typ' put: 'JWT'.
	headerfields at: 'alg' put: 'HS256'.

