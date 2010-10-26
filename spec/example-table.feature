Feature: An unindented feature with lots of tables
As a developer
I want cucumber.vim to indent tables in features correctly
So that I can have eyes that don't bleed

Background:
Given there is a feature with lotsa tables

Scenario: Indent the feature correctly
Given I have a table with gaps in it:
| 1 | one |
| 2 | two |

| 3 | three |
| 4 | four |
