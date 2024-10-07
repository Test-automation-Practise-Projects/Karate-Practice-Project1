Feature:This feature file is designed to test various API operations (GET, POST, PUT, and DELETE) using the 'reqres.in' API.

  Scenario: Test GET single user request
    Given url 'https://reqres.in/api/users/2'
    When method GET
    Then status 200
    And match response.data.first_name == 'Janet'
    And match response.data.last_name == 'Weaver'


  Scenario: Test POST request to create a user
    Given url 'https://reqres.in/api/users'
    And request { name: 'morpheus', job: 'leader' }
    When method POST
    Then status 201
    And match response.name == 'morpheus'
    And match response.job == 'leader'

  Scenario: Test PUT request to update a user
    Given url 'https://reqres.in/api/users/2'
    And request { name: 'morpheus', job: 'zion resident' }
    When method PUT
    Then status 200
    And match response.name == 'morpheus'
    And match response.job == 'zion resident'

  Scenario: Test DELETE request to remove a user
    Given url 'https://reqres.in/api/users/2'
    When method DELETE
    Then status 204
