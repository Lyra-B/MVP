Feature: Administrator sign in
  Scenario: An administrator signs in
    Given there are some administrators
      And I am in the homepage
      And I sign in
    When I enter my details as an administrator
      And I submit
    Then I see my administrator dashboard