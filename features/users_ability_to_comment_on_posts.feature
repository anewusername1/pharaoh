@http://www.pivotaltracker.com/story/show/7857673
Feature: Users ability to comment on posts
	 Must be logged in to view/add comments on posts. No approval for these, just comments.

  Scenario: User should be able to comment on posts
    Given I have the following user:
      | name | role | email | 
      | John | user | john@yourmom.com |
      | Jacob | user | jacob@yourmom.com |
      | Jingle | admin | jingle@yourmom.com |
    And I am signed in
    When I am on the post page
    And I follow "Comment on post"
    And I fill in "Comment" with "What a great post!"
    And I press "comment"
    Then I should see "Comment saved"
