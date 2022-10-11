Feature: Teste de API goRest

  Background:
    * url 'https://gorest.co.in/'
    * def auth = read('auth.json')
    * def include =
      """
      {"name":"Wellington Junior", "gender":"male", "email":"wjunior2123@gmail.com", "status":"active"}
      """
    * def alter =
      """
      {"name":"Wellington Jr", "email":"wjunior1212@gmail.com", "status":"active"}
      """

    * def user = '4271'

  Scenario: get all user
    Given path '/public/v2/users'
    When method get
    Then status 200
    * print response

  Scenario Outline: get my user
    Given path '/public/v2/users/' + <user>
    And header Authorization = 'Bearer ' + auth
    When method get
    Then status 200
    And match response contains {"id": "#number" ,"name": "#string","email": "#string","gender": "#string","status": "#string"}
    * print response
    Examples:
      |user|
      |2423|
      |2422|
      |2421|


  Scenario: Create new user

    Given path '/public/v2/users'
    And request include
    And header Authorization = 'Bearer ' + auth
    When method post
    Then status 201
    And match response contains include
    * print response

  Scenario: Alter user

    Given path '/public/v2/users/' + user
    And request include
    And header Authorization = 'Bearer ' + auth
    When method PATCH
    Then status 200
    * print response

  Scenario: Delete user

    Given path '/public/v2/users/' + user
    And header Authorization = 'Bearer ' + auth
    When method Delete
    Then status 204
    * print response
