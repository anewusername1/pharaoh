@http://www.pivotaltracker.com/story/show/8083039
Feature: Admin ability to manage posts
  Admin must approve/deny and be able to delete posts. 
  If denying, should be able to give reason (doesn't have to). 
  If approved, it should send an email to the user if their email address was provided.

  Scenario: Admin can approve and deny posts
    Given I have the following posts:
      | subtext | text | approved | visible | created_at |
      | I hate it when | that happens | false | false | 2011-01-23 |
      | I love it when | that happens | false | false | 2011-02-23 |
      | I want to | eat a cheeseburger | false | false | 2010-03-20 |
    And I am on the admin page
    Then I should see "I hate it when that happens"

