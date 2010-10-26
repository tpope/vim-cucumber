# Comments for a feature.
# Maybe even multi-line comments.
Feature: An feature with lots of comments
  As a developer
  # A good developer, too
  I want to put comments everywhere
  # Everywhere!
  So that I can remember things for later
  # So many things...

  # Comments for the background.
  # Maybe even multi-line comments.
  Background:
    # Comment on this given line:
    Given there is a heavily commented feature
    # Comments trailing the background steps.
    # Maybe even multi-line comments.

  # Comments above scenarios are really common. People are always like,
  # justifying their choice of tags.
  @tag1 @tag2
  Scenario: Indent the feature with comments correctly
    Given I have a file with the lines:
    # A comment at the start of a table.
    | 1 | one |
    | 2 | two |
    # A comment in the middle of a table.
    | 3 | three |
    | 4 | four |
    # A comment after a table.
    When I open the file
    And I press gg=G
    Then I should see the file reindent good
    # Comments trailing the steps.

  Scenario: A scenario with a table and then a comment
    Then I have a table
      | 5 | five |
      | 6 | six |

  # A comment for a scenario after a table and whitspace.
  Scenario: Another scenario
    Then I am done
    # Comments trailing the steps.

  # A comment for a scenario after some trailing comments.
  Scenario: Yet more scenariage
    Then I am really done. Promise.
