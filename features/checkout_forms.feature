Feature: Completing the checkout forms

  Background:
    Given I am on the site home page

  Scenario: Quote form testing
    Given I am on the site services page
    When I fill the Quote form and submit. Data: "test", "e.bezhuratest@gmail.com"
    Then I sent the filled form

  Scenario: Order form testing
    Given I am on the site order page
    When I fill the Order form and submit. Data: "test", email: "e.bezhuratst@gmail.com", password: "11111".