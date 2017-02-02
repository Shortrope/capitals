Feature: Return the name of the capital city of a multi word state name

  Rules:
  - The state name is case insensitive
    New York, new york, nEW yORk should all work
  - If the state name has more than one word it must be enclosed in quotes
    "New Jersey", "North Dakota"
  - If a multiword state name does not have quotes an error message is displayed
    "unknown state: check spelling."
  - A mispelled state name will return an error message
    "unknown state: check spelling."
    
  Background:
    Given the 'capital' utility is executable
    And is in the environment PATH
    
  Scenario Outline: A multiword state name is entered using quotes
    Given JoJo wants to know the capital of New York
    When 'capital "<multiWordState>"' is entered
    Then '<capital>' should be displayed

    Examples:
      | multiWordState | capital  |
      | New Hampshire  | Concord  |
      | New Jersey     | Trenton  |
      | New Mexico     | Santa Fe |
      | New York       | Albany   |
      | North Carolina | Raleigh  |
      | North Dakota   | Bismarck |

  Scenario: A multiword state name is entered without quotes
    Given JoJo wants to know the capital of New Mexico
    When 'capital New Mexico' is entered
    Then display 'New' is not a state. Please check spelling. Multi word state names require quotes.

  Scenario: An incorrectly spelled multi word state name is entered 
    Given JoJo wants to know the capital of South Dakota
    When 'capital "South Dakot' is entered
    Then display 'South Dakot' is not a state. Please check spelling. Multi word state names require quotes.

