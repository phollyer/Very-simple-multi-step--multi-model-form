Feature: Home Page
                        
  As a web site provider
  In order that visitors have a place to start
  I should provide a default route to the home page
  
  @approved
  Scenario: Visit the home page
   Given I am not on the site
   When I visit the site
   Then I should be on the home page