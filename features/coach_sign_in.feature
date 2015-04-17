Feature: Coach sign in
  Scenario: A coach signs in
    Given there are some coaches
      And I am in the homepage
      And I sign in
    When I enter my details
      And I submit
    Then I see my profile page
      And I see a calendar with my sessions