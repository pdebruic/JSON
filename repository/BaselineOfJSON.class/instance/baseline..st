baselines
baseline: spec
<baseline>
	spec
		for: #(#squeak #pharo)
		do: [ spec repository: 'http://smalltalkhub.com/mc/PharoExtras/JSON/main'.
			spec blessing: #baseline.
			spec package: 'JSON'.
			spec group: 'default' with: #('JSON') ].
	spec
		for: #gemstone
		do: [ spec
				repository: 'http://www.smalltalkhub.com/mc/pdebruic/JSONg/main' ]