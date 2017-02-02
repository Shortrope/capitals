Feature: Return the name of the capital city of a state with abbreviated North or South

  Rules:
  - The words North and South can be abbreviated but must have a trailing period
    "S. Carolina"
  - The state name is case insensitive
    n. dakota and N. Dakota should work
  - If the state name has more than one word it must be enclosed in quotes
    "N. Dakota"
  - If a multiword state name does not have quotes an error message is displayed
    "unknown state: check spelling."
  - A mispelled state name will return an error message
    "unknown state: check spelling."
    
  Background:
    Given the 'capital' utility is executable
    And is in the environment PATH
    
  Scenario: A state name is entered with an abbreviated 'North' - 'N.'
    Given JoJo wants to know the capital of N. Carolina
    When 'capital "<state>"' is entered
    Then display '<capital>'

    Examples:
      | state       | capital     |
      | N. Carolina | Raleigh     |
      | N. Dakota   | Bismarck    |

  Scenario: A state name is entered with an abbreviated 'South' - 'S.'
    Given JoJo wants to know the capital of S. Carolina
    When 'capital "<state>"' is entered
    Then display '<capital>'

    Examples:
      | state       | capital     |
      | S. Carolina | Columbia    |
      | S. Dakota   | Pierre      |

