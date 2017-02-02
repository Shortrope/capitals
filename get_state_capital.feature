Feature: Return the name of the capital city of a state

  The 'capital' utility should return the capital city of a state name entered as
  the first argument

  Rules:
  - The state name is case insensitive
    Alaska, alaska or aLasKa should work
  - The state name can be entered in full text or 2 character abbreviation
    Alaska or AK or ak should all work
  - If the state name has more than one word it must be enclosed in quotes
    "New Jersey", "North Dakota"
  - The words North and South can be abbreviated but must have a trailing period
    "S. Carolina"
  - If a multiword state name does not have quotes an error message is displayed
    "unknown state: check spelling."
  - A mispelled state name will return an error message
    "unknown state: check spelling."
    
  Background:
    Given the 'capital' utility is executable
    And is in the environment PATH
    
  Scenario: Russel Sprout wants to know the name of the capital city of Alabama
    Given Russel Sprout does not care about capitalization of proper names
    When he enters 'capital alabama'
    Then 'Montgomery' should be displayed

  Scenario Outline: Get the name of the capital city of a state using lowercase state name
    Given Russel wants to know the capital of <state>
    When he enters 'capital <lowerCaseState>'
    Then '<capital>' should be displayed

    Examples:
      | state       | lowerCaseState | capital     |
      | Alabama     | alabama        | Montgomery  |
      | Alaska      | alaska         | Juneau      |
      | Arizona     | arizona        | Phoenix     |
      | Arkansas    | arkansas       | Little Rock |
      | California  | california     | Sacramento  |
      | Colorado    | colorado       | Denver      |
      | Connecticut | connecticut    | Hartford    |
      | Delaware    | delaware       | Dover       |
      | Florida     | florida        | Tallahassee |

  Scenario Outline: Emma Roids wants to know the name of the capital city of Alaska
    Given Emma Roids is anal about proper grammar
    When she enters 'capital <state>'
    Then '<capital>' should be displayed

    Examples:
      | state       | capital     |
      | Alabama     | Montgomery  |
      | Alaska      | Juneau      |
      | Arizona     | Phoenix     |
      | Arkansas    | Little Rock |
      | California  | Sacramento  |
      | Colorado    | Denver      |
      | Connecticut | Hartford    |
      | Delaware    | Dover       |
      | Florida     | Tallahassee |

  Scenario Outline: Wendy Wacko wants to know the name of the capital city of Arizona
    Given Wendy Wacko drinks too much vodka with her coffee
    When she enters 'capital <mixedCaseState>'
    Then '<capital>' should be displayed

    Examples:
      | mixedCaseState | capital     |
      | AlaBama        | Montgomery  |
      | alaSka         | Juneau      |
      | ARiZONa        | Phoenix     |
      | ArKANSAS       | Little Rock |
      | CalifORnIA     | Sacramento  |
      | cOLOrADo       | Denver      |
      | CoNNectIcut    | Hartford    |
      | DelaWAre       | Dover       |
      | fLoRiDA        | Tallahassee |


  Scenario: An incorrectly spelled state name is entered 
    Given JoJo wants to know the capital of Pennsylvania
    When 'capital Pensilvania' is entered
    Then display 'Pensilvania' is not a state. Please check spelling. Multi word state names require quotes.
