Feature: The main page.
  Given that this is a ruby on rails app
  As a user
  I should be able to visit the main page

    Scenario: visit homepage
      Given that I am on the homepage
      Then I should see "Semantix"
