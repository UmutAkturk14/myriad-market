require "test_helper"

class OffersControllerTest < ActionDispatch::IntegrationTest
  test "should get destroy" do
    get offers_destroy_url
    assert_response :success
  end
end
