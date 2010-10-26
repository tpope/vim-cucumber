Feature: An unindented feature with lots of tables
As a developer
I want cucumber.vim to indent tables in features correctly
So that I can have eyes that don't bleed

Background:
Given there is a feature with lotsa tables

Scenario: Indent the feature correctly
Given I have a file with the lines:
| 1 | one |
| 2 | two |
| 3 | three |
| 4 | four |
When I open the file
And I press gg=G
Then I should see the file reindent good
