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

  Scenario: JB Sprout enters the state name using two letter state abbreviation in lowercase
    Given 
    When he enters 'capital ar'
    Then 'Little Rock' should be displayed

  Scenario: CJ Roids enters the state name using two letter state abbreviation in uppercase
    Given 
    When she enters 'capital CA'
    Then 'Sacramento' should be displayed

  Scenario: Dwayne Pipe enters a multiword state name using quotes
    Given 
    When he enters 'capital "New York"'
    Then 'Albany' should be displayed

  Scenario: Iona Ford enters a multiword state name and abbreviates the word North with N.
    Given
    When she enters 'capital "N. Dakota"'
    Then 'Bismarck' should be displayed
  
  Scenario: Iona enters a multiword state name and abbreviates the word South with S.
    Given
    When she enters 'capital "S. Dakota"'
    Then 'Pierre' should be displayed

  Scenario: Russel Sprout enters a multiword state name and does not use quotes
    Given Russel is forgetful
    When he enters 'capital New Mexico'
    Then display 'New' is not a state. Please check spelling. Multi word state names require quotes.

  Scenario: Emma Roids enters a state name and spells it incorrectly
    Given 
    When she enters 'capital Pensilvania'
    Then display 'Pensilvania' is not a state. Please check spelling. Multi word state names require quotes.
