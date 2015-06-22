baselines
baseline: spec
	<baseline>

	spec for: #'common' do: [
		spec repository: 'gitfiletree:///opt/git/t1/common'.
		spec package: 'JSON'.
		spec group: 'default' with: #('JSON' ). ].

	spec for: #'gemstone' do: [
		spec repository: 'gitfiletree:///opt/git/t1/gemstone'. ].
