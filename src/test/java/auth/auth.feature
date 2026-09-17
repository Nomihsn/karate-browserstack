Feature: Authentication

  Scenario: Generate authentication token

    * def loginResponse =
    """
    {
      "accessToken": "test-token-12345",
      "userId": "USER001"
    }
    """

    * def token = loginResponse.accessToken
    * def headers = { Authorization: 'Bearer ' + token }

    * print 'Access Token:', token
    * match token == '#string'