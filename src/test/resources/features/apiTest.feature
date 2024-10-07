Feature: Test GET, POST, PUT, and DELETE API requests

  Scenario: Test GET request
#   Specifies the URL. Refers to the user with id=1.
    Given url 'https://jsonplaceholder.typicode.com/users/1'
#   used to retrieve data from the server. It will fetch user information from the given URL.
    When method GET
#    Asserts that the response status code should be 200 (success). The server should return this code when the request is successful.
    Then status 200
#    checks if the name field in the response matches 'Leanne Graham', which ensures you're getting the correct user data.
    And match response.name == 'Leanne Graham'
#    checks if the user's city in the address object matches 'Gwenborough'.
    And match response.address.city == 'Gwenborough'

  Scenario: Test POST request
    Given url 'https://jsonplaceholder.typicode.com/posts'

#    This is the data being sent in the body of the request (a new post with a title, body, and userId).
    And request { title: 'foo', body: 'bar', userId: 1 }
#    Specifies that the request is using the POST method to create a new post.
    When method POST
#    Asserts that the response status code should be 201 (Created). This indicates that the resource was successfully created on the server.
    Then status 201
#    Checks that the title in the response matches what was sent in the request.
    And match response.title == 'foo'

#    Checks that the body field in the response matches what was sent in the request.
    And match response.body == 'bar'
#    Ensures that the correct user ID is associated with this new post.
    And match response.userId == 1

  Scenario: Test PUT request
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
#    This sends the new data to update the post:
    And request { id: 1, title: 'updated title', body: 'updated body', userId: 1 }
#    Specifies that this is a PUT request to update the entire resource with new data.
    When method PUT
#    Asserts that the response status code should be 200 (OK), indicating the resource was successfully updated.
    Then status 200
#    Verifies that the updated title is returned in the response.
    And match response.title == 'updated title'
    And match response.body == 'updated body'
#    Ensures that the userId is still associated with this post.
    And match response.userId == 1

  Scenario: Test DELETE request
    Given url 'https://jsonplaceholder.typicode.com/posts/1'
#    Specifies that this request will use the DELETE method to remove the resource.
    When method DELETE
#    Asserts that the response status code should be 200 (OK), indicating that the resource was successfully deleted.
    Then status 200
