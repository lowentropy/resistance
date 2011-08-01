Feature: Start a new game of Resistance

  As a player of "The Resistance"
  I want to start a new game
  In order to start playing and recording moves

  @javascript
  Scenario: First game every played
    When I go to the new game page
    And I add players "Bob", "Ted", and "Susan"
    And I start the game
    Then I should see players "Bob", "Ted", and "Susan"
  
  @javascript
  Scenario: Next game after that
    When I start a game with "Bob", "Ted", and "Susan"
    And I go to the new game page
    Then I should see players "Bob", "Ted", "Susan", and ""
    When I remove "Ted" as a player
    And I add "Jake" as a player
    And I start the game
    Then I should see players "Bob", "Susan", and "Jake"
