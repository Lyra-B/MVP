Feature: Coach sign in
  Scenario: A coach signs in
    Given there is at least a coach
      And I am in the homepage
      And I sign in
    When I enter my details as a coach
      And I submit
    Then I see my coach dashboard