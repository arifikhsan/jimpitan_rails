require "test_helper"

class VillagesControllerTest < ActionDispatch::IntegrationTest
  test "should get create" do
    get villages_create_url
    assert_response :success
  end
end
