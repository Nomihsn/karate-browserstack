@mock
Feature: Payment Service with mocked Account Service

  Scenario: Payment succeeds when Account Service is available

    Given url accountServiceUrl
    And path 'accounts', '123'
    When method get
    Then status 200

    * print 'Account Service Response:', response

    * match response.accountId == '123'
    * match response.balance == '#number'
    * match response.currency == 'NGN'
    * match response.status == 'ACTIVE'


  Scenario: Payment handles account not found

    Given url accountServiceUrl
    And path 'accounts', 'not-found'
    When method get
    Then status 404

    * print 'Account Service Response:', response

    * match response.error == 'ACCOUNT_NOT_FOUND'


  Scenario: Payment handles Account Service unavailable

    Given url accountServiceUrl
    And path 'accounts', 'unavailable'
    When method get
    Then status 503

    * print 'Account Service Response:', response

    * match response.error == 'ACCOUNT_SERVICE_UNAVAILABLE'

