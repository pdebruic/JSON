baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec package: 'JSON'.
		spec group: 'default' with: #('JSON' ). ].


spec
    for: #'gemstone'
    do: [ 
      spec package: 'JSON' with: [ spec requires: #('JSONGemStone') ].
      spec group: 'default' with: #('JSON') ]
