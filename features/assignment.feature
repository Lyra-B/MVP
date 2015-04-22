Feature: Assignment
  Background:
    Given there is at least a coach
      And I am in the homepage
      And I sign in
    When I enter my details as a coach
      And I submit
    Then I see my coach dashboard
    @wip @javascript
  Scenario: A coach accepts a session
    Given I have some notifications
      And I select the button notifications
    When I select accept on "assignment_1"
    Then the status of this assignment becomes accepted
    @wip @javascript
  Scenario: A coach declines a session
    Given I have some notifications
      And I select the button notifications
    When I select decline on "assignment_2"
    Then the status of this assignment becomes declined
