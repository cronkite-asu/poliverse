Feature: User Sessions

  So that I can blah, blah, blah
  As a registered user
  I want to log in and log out

  Scenario: log in
    Given I am a registered user
    And I am on the homepage
    When I login
    Then I should see "Logged in successfully."
    And I should see "Logout"

  Scenario: log out
    Given I am logged in
    And I am on the homepage
    When I logout
    Then I should see "Logout successful."
    And I should see "Register"
    And I should see "Log In"