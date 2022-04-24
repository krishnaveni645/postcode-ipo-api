@ukspf @application
Feature: GET /get-application

  Scenario: A GET request is made to the /postal-code endpoint and there is postal data stored
    Given I set GET api endpoint "us/90210"
    When I Set HEADER param request content type as "application/json."
    And Send GET HTTP request
    Then I receive valid HTTP response code 200 for "GET."
    And Response BODY "GET" is non-empty


  Scenario: A GET request is made to the /get-application endpoint but there is no applicant data
    Given I have a valid JWT Token in the Authorization header for the return code "WTEUA-9B87W"
    When a get request is made to the "/get-application" endpoint
    Then a 404 status code should be returned
    And a "Grant application not found" error is returned in the custom error response

  Scenario: A GET request is made to the /get-application endpoint with an invalid JWT token header
    Given I have the value "Bearer eyJhbGciOiJIUzUxMiJ9.eyPxCWIiOiJVT1dQTy1ITFZQTiIsImlzcyI6Imdvdi51ayIsImlhdCI6MTYzMzM1NTQ4NywiZXhwIjoxNjMzMzY5ODg3fQ.8F2Cqw0A4V-uYG6Z8wWoGGoNhLIlXT4r17V6nUfvhotdBkqoQaXKUitpvuuzf_820QKLOq16y0tIlUKhf6bMug" set in the Authorization header
    When a get request is made to the "/get-application" endpoint
    Then a 401 status code should be returned
    And a "Unauthorized" error is returned in the default error response

  Scenario: A GET request is made to the /get-application endpoint with an empty JWT token header
    Given I have the value " " set in the Authorization header
    When a get request is made to the "/get-application" endpoint
    Then a 401 status code should be returned
    And a "Unauthorized" error is returned in the default error response

  Scenario: A POST request is made to the /get-application endpoint
    Given I have a valid JWT Token in the Authorization header for the return code "WTEUA-9B87K"
    When a post request is made to the "/get-application" endpoint
    Then a 405 status code should be returned
    And a "Method Not Allowed" error is returned in the default error response

  Scenario: A PUT request is made to the /get-application endpoint
    Given I have a valid JWT Token in the Authorization header for the return code "WTEUA-9B87K"
    When a put request is made to the "/get-application" endpoint
    Then a 405 status code should be returned
    And a "Method Not Allowed" error is returned in the default error response

  Scenario: A PATCH request is made to the /get-application endpoint
    Given I have a valid JWT Token in the Authorization header for the return code "WTEUA-9B87K"
    When a patch request is made to the "/get-application" endpoint
    Then a 405 status code should be returned
    And a "Method Not Allowed" error is returned in the default error response

  Scenario: A DELETE request is made to the /get-application endpoint
    Given I have a valid JWT Token in the Authorization header for the return code "WTEUA-9B87K"
    When a delete request is made to the "/get-application" endpoint
    Then a 405 status code should be returned
    And a "Method Not Allowed" error is returned in the default error response