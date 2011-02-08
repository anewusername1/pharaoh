@http://www.pivotaltracker.com/story/show/7857673
Feature: Users ability to comment on posts
  Must be logged in to comment on posts. No approval for these, just comments. Users ability to thumbs down a comment or mark it as offensive. Offensive comments will be hidden when they receive more than 5 offensive ratings.
  Posts will have the same offensive rating system and the same thumbs up/down rating. That way we can track the best/worst posts and user can sort by that.

  Scenario: User should be able to comment on posts
    Given I have the following user:
      | name | role | email | 
      | John | user | john@yourmom.com |
      | Jacob | user | jacob@yourmom.com |
      | Jingle | admin | jingle@yourmom.com |
    And I am signed in
    When I am on the "post" page
    And I follow "Comment on post"
    And I fill in "Comment" with "What a great post!"
    And I press "comment"
    Then I should see "Comment saved"
