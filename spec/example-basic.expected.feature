Feature: An unindented feature
	As a developer
	I want cucumber.vim to indent features correctly
	So that I can easily correct my BA's sloppiness

	Background:
		Given there is a sloppily written feature

	Scenario: Indent the feature correctly
		Given I have a file with the lines:
			| 1 | one |
			| 2 | two |
			| 3 | three |
			| 4 | four |
		When I open the file
		And I press gg=G
		Then I should see the file reindent good
