require "test_helper"

class PropertiesControllerTest < ActionDispatch::IntegrationTest
  test "should get show" do
    get properties_show_url
    assert_response :success
  end
end
