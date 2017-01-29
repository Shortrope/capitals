Feature: Return the name of the capital city of a state

  The 'capital' utility should return the name of the capital city of the
  state name entered as the first argument

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

  Scenario: Emma Roids wants to know the name of the capital city of Alaska
    Given Emma Roids is anal about proper grammar
    When she enters 'capital Alaska'
    Then 'Juneau' should be displayed

  Scenario: Wendy Wacko wants to know the name of the capital city of Arizona
    Given Wendy Wacko drinks too much vodka with her coffee
    When she enters 'capital aRiZonA'
    Then 'Phoenix' should be displayed

  Scenario: A two letter state abbreviation is entered in lowercase
    Given JoJo wants to know the capital of Arkansas
    When 'capital ar' is entered
    Then 'Little Rock' should be displayed

  Scenario: A two letter state abbreviation is entered in uppercase
    Given JoJo wants to know the capital of California
    When 'capital CA' is entered
    Then 'Sacramento' should be displayed

  Scenario: A multiword state name is entered using quotes
    Given JoJo wants to know the capital of New York
    When 'capital "New York"' is entered
    Then 'Albany' should be displayed

  Scenario: A multiword state name is entered and the word 'North' is abbreviated with 'N.'
    Given JoJo wants to know the capital of North Dakota
    When 'capital "N. Dakota"' is entered
    Then 'Bismarck' should be displayed
  
  Scenario: A multiword state name is entered and the word 'South' is abbreviated with 'S.'
    Given JoJo wants to know the capital of South Dakota
    When she enters 'capital "S. Dakota"'
    Then 'Pierre' should be displayed

  Scenario: A multiword state name is entered without quotes
    Given JoJo wants to know the capital of New Mexico
    When 'capital New Mexico' is entered
    Then display 'New' is not a state. Please check spelling. Multi word state names require quotes.

  Scenario: An incorrectly spelled state name is entered 
    Given JoJo wants to know the capital of Pennsylvania
    When 'capital Pensilvania' is entered
    Then display 'Pensilvania' is not a state. Please check spelling. Multi word state names require quotes.
