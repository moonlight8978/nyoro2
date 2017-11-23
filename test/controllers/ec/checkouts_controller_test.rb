require 'test_helper'

class Ec::CheckoutsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get ec_checkouts_index_url
    assert_response :success
  end

end
