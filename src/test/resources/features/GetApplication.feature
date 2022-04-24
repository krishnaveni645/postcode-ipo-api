@ukspf @application
Feature: GET /get-application

  Scenario: A GET request is made to the us/90210 endpoint and I get Us postcode data
    Given I set GET api endpoint "us/90210"
    When I Set HEADER param request content type as "application/json."
    Then I receive valid HTTP response code 200



  Scenario: A GET request is made to the us/90211 invalid endpoint but there is no postal data
    Given I set GET api endpoint "us/90211"
    When I Set HEADER param request content type as "application/json."
    Then I receive valid HTTP response code 404
    And a "Post Code not found" error is returned in the custom error response


  Scenario: A GET request is made to the GB/AB1 endpoint and I get Great Britain postcode data
    Given I set GET api endpoint "GB/AB1"
    When I Set HEADER param request content type as "application/json."
    Then I receive valid HTTP response code 200
