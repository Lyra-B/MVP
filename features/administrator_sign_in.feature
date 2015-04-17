Feature: Administrator sign in
  Scenario: An administrator signs in
    Given there are some administrators
      And I am in the homepage
      And I sign in
    When I enter my details
      And I submit
    Then I see my profile page
      And I see a calendar with the sessions I have created