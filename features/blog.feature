@selenium
Feature: creation, reading, updating and destroying blog posts.

  Scenario: The index page shows existing blog posts.
    Given that a post exists
    When visiting the blog index
    Then the post title must be showing
    And the post content must be showing
  Scenario: The details page shows a post.
    Given that a post exists
    When visiting the post page
    Then the post title must be showing
    And the post content must be showing
  Scenario: It is possible to create a new post.
    When visiting the blog index
    And clicking the link "New"
    And filling the field "Title" with "new post title"
    And filling the field "Content" with "new post content"
    And clicking the button "Create Post"
    Then the text "Post was successfully created" must be showing
    And the text "new post title" must be showing
    And the text "new post content" must be showing
  Scenario: It is possible to edit a post.
    Given that a post exists
    When visiting the blog index
    And clicking the link "Edit"
    And filling the field "Title" with "new post title"
    And filling the field "Content" with "new post content"
    And clicking the button "Update Post"
    Then the text "Post was successfully updated" must be showing
    And the text "new post title" must be showing
    And the text "new post content" must be showing
  Scenario: It is possible to destroy a post.
    Given that a post exists
    When visiting the blog index
    And confirming the dialog after clicking "Destroy"
    Then the text "Post was successfully destroyed" must be showing
    And the text "Existing post title" must not be showing
