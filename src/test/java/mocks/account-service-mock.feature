```gherkin
Feature: Account Service Mock

  Scenario: pathMatches('/accounts/123')
    * def response =
    """
    {
      "accountId": "123",
      "balance": 50000,
      "currency": "NGN",
      "status": "ACTIVE"
    }
    """

    * def responseStatus = 200


  Scenario: pathMatches('/accounts/not-found')
    * def response =
    """
    {
      "error": "ACCOUNT_NOT_FOUND",
      "message": "Account does not exist"
    }
    """

    * def responseStatus = 404


  Scenario: pathMatches('/accounts/unavailable')
    * def response =
    """
    {
      "error": "ACCOUNT_SERVICE_UNAVAILABLE",
      "message": "Account Service is temporarily unavailable"
    }
    """

    * def responseStatus = 503
```
