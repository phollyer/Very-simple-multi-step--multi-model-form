@approved
Feature: Multistep Form

  In order to submit the data for multiple models
  As a site visitor
  I should be able to fill out the data in strict stages
  
  Scenario: Submit the Company Data
    Given I am on the new company page    
    When I fill in "company[company_name]" with "A Ltd"
    And I press "Create Company"
    Then I should be on the new company contact page
    And there should be 0 companies in the database  
    
  Scenario: Submit the Company and the Company Contact Data  
    Given I am on the new company page    
    When I fill in "company[company_name]" with "A Ltd"
    And I press "Create Company"      
    And I fill in "company_contact[contact_name]" with "Joe Bloggs" 
    And I press "Create Company contact"
    Then there should be 1 company in the database
    And there should be 1 company contact in the database
    And I should see "A Ltd"
    And I should see "Joe Bloggs"