require "test_helper"

class RelaxerControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get relaxer_index_url
    assert_response :success
  end
end
