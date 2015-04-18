@wip
Feature: Display Coaches
  Background:
    Given there are some administrators
      And there are some coaches
      And I am in the homepage
      And I sign in
    When I enter my details as an administrator
      And I submit
  Scenario: An administrator sees a list of coaches on his dashboard
    Then I see my administrator dashboard
      And there are some sessions
      And I see a list of coaches

