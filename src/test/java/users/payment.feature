Feature: Payment API

  Background:
    # Reusable authentication
    * def auth = call read('classpath:auth/auth.feature')
    * def token = auth.token
    * def authorization = 'Bearer ' + token


  @payment
  Scenario: Create and validate a payment

    # ==========================================
    # 1. Prepare payment request
    # ==========================================

    * def customerId = 'CUST001'

    * def paymentRequest =
    """
    {
      "amount": 5000,
      "currency": "NGN",
      "customerId": "#(customerId)"
    }
    """


    # ==========================================
    # 2. Validate request before sending
    # ==========================================

    * match paymentRequest ==
    """
    {
      amount: '#number',
      currency: 'NGN',
      customerId: '#string'
    }
    """


    # ==========================================
    # 3. Send API request
    # ==========================================

    Given url baseUrl
    And path 'posts'
    And header Authorization = authorization
    And request paymentRequest

    When method post


    # ==========================================
    # 4. Validate HTTP response
    # ==========================================

    Then status 201


    # ==========================================
    # 5. Validate response
    # ==========================================

    And match response.id == '#number'


    # ==========================================
    # 6. Capture dynamic value
    # ==========================================

    * def transactionId = response.id

    * print 'Transaction ID:', transactionId


    # ==========================================
    # 7. Conditional validation
    # ==========================================

    # Simulate a payment response
    * def paymentResponse =
    """
    {
      "status": "SUCCESS",
      "transactionId": 12345
    }
    """


    # Create reusable validation function
    * def validatePayment =
    """
    function(response) {
      if (response.status == 'SUCCESS') {
        karate.match(response.transactionId, '#number')
        return 'Payment successful'
      }
      else if (response.status == 'FAILED') {
        karate.match(response.errorCode, '#string')
        return 'Payment failed'
      }
      return 'Unknown payment status'
    }
    """


    # Execute conditional validation
    * def validationResult = call validatePayment paymentResponse

    * print validationResult


  @payment
  Scenario Outline: Create payment with different amounts

    * def paymentRequest =
    """
    {
      "amount": <amount>,
      "currency": "<currency>",
      "customerId": "<customerId>"
    }
    """

    Given url baseUrl
    And path 'posts'
    And header Authorization = authorization
    And request paymentRequest

    When method post

    Then status 201

    And match response.id == '#number'


    Examples:
      | amount | currency | customerId |
      | 100    | NGN      | CUST001    |
      | 500    | NGN      | CUST002    |
      | 1000   | NGN      | CUST003    |