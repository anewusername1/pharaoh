Feature: visitors can view posts
  Scenario: visiting home page gives me posts
    Given I have the following posts:
      | subtext | text | approved | visible | created_at |
      | I hate it when | that happens | true | true | 2011-01-23 |
      | I love it when | that happens | true | true | 2011-02-23 |
      | I want to | eat a cheeseburger | true | true | 2010-03-20 |
    When I go to the home page
    Then I should see "I hate it when that happens"
    And I should see "I love it when that happens"
    And I should see "I want to eat a cheeseburger"
