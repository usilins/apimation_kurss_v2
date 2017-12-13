require 'rest-client'
require 'test-unit'

def login_positive
  login_payload = { :login => @test_user.email,
                    :password => @test_user.password }.to_json

  response = post("https://www.apimation.com/login",
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: {},
                  payload: login_payload)

  # Check if 200 OK is received
  assert_equal(200, response.code, "Login failed! Respone : #{response}")

  response_hash = JSON.parse(response)

  assert_equal(@test_user.email, response_hash['email'], 'Email in the response is not correct!')

  assert_not_equal(nil, response_hash['user_id'], 'User id is empty!')

  assert_equal(@test_user.email, response_hash['login'], 'Login in the response is not correct!')

  @test_user.set_session_cookie(response.cookies)

  @test_user.set_user_id(response_hash['user_id'])
end

def check_personal_info
  response = get("https://www.apimation.com/user",
                 headers: {},
                 cookies: @test_user.session_cookie)

  assert_equal(200, response.code, "Failed to fetch user data. Response : #{response}")

  # Asserti
end

def login_wrong_password
  login_payload = { :login => @test_user.email,
                    :password => 'nepareizaParole' }.to_json

  response = post("https://www.apimation.com/login",
                  headers: { 'Content-Type' => 'application/json' },
                  cookies: {},
                  payload: login_payload)

  # Check if error 400 is received
  assert_equal(400, response.code, "Wrong error code received! Respone : #{response}")

  response_hash = JSON.parse(response)

  assert_equal('002', response_hash['error-code'], 'Error code in response is not correct!')

  assert_equal('Username or password is not correct', response_hash['error-msg'], 'Error message is not correct!')

  @test_user.set_session_cookie(response.cookies)
end

def check_user_not_logged
  response = get("https://www.apimation.com/user",
                 headers: {},
                 cookies: @test_user.session_cookie)

  # Check if error 400 is received
  assert_equal(400, response.code, "Wrong error code received! Respone : #{response}")

  response_hash = JSON.parse(response)

  assert_equal('001', response_hash['error-code'], 'Error code in response is not correct!')

  assert_equal('No session', response_hash['error-msg'], 'Error message is not correct!')
end