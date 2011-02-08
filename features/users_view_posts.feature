Feature: Users can view posts
  Scenario:
    Given the following posts:
      | subtext        | text           |
      | I hate it when | worlds collide |
    And I am on the homepage
    Then I should see 1 post