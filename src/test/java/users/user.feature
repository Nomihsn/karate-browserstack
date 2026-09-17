Feature: User API

  Scenario: Get a user

    Given url 'https://jsonplaceholder.typicode.com'
    And path 'users', 1
    When method get
    Then status 200
    And match response.name == 'Leanne Graham'