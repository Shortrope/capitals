Feature: Return the name of the capital city of a 2 character state abbreviation

  Rules:
  - The state abbreviation is case insensitive
    ca, Ca, CA, cA sould all work
  - A mispelled state abbreviation will return an error message
    "unknown state: check spelling."
    
  Background:
    Given the 'capital' utility is executable
    And is in the environment PATH
    
  Scenario Outline: A two letter state abbreviation is entered in lowercase
    Given JoJo wants to know the capital of a state
    When 'capital <stateAbbrev>' is entered
    Then '<capital>' should be displayed

    Examples:
      | stateAbbrev | capital     |
      | al          | Montgomery  |
      | ak          | Juneau      |
      | az          | Phoenix     |
      | ar          | Little Rock |
      | ca          | Sacramento  |
      | co          | Denver      |
      | ct          | Hartford    |
      | de          | Dover       |
      | fl          | Tallahassee |

  Scenario Outline: A two letter state abbreviation is entered in uppercase
    Given JoJo wants to know the capital of a state
    When 'capital <stateAbbrev>' is entered
    Then '<capital>' should be displayed

    Examples:
      | stateAbbrev | capital     |
      | AL          | Montgomery  |
      | AK          | Juneau      |
      | AZ          | Phoenix     |
      | AR          | Little Rock |
      | CA          | Sacramento  |
      | CO          | Denver      |
      | CT          | Hartford    |
      | DE          | Dover       |
      | FL          | Tallahassee |

  Scenario Outline: A two letter state abbreviation is entered in mixed case
    Given JoJo wants to know the capital of a state
    When 'capital <stateAbbrev>' is entered
    Then '<capital>' should be displayed

    Examples:
      | stateAbbrev | capital     |
      | aL          | Montgomery  |
      | Ak          | Juneau      |
      | aZ          | Phoenix     |
      | aR          | Little Rock |
      | Ca          | Sacramento  |
      | cO          | Denver      |
      | Ct          | Hartford    |
      | dE          | Dover       |
      | fL          | Tallahassee |

  Scenario: An incorrectly spelled state name is entered 
    Given JoJo wants to know the capital of Delaware, DE
    When 'capital DI' is entered
    Then display 'DI' is not a state. Please check spelling. Multi word state names require quotes.
