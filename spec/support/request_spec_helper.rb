require "devise/jwt/test_helpers"

module RequestSpecHelper
  def json_response
    JSON.parse(response.body)
  end

  def valid_headers(user)
    headers = { "Accept" => "application/json" }
    Devise::JWT::TestHelpers.auth_headers(headers, user)
  end
end
