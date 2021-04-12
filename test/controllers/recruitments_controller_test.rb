require 'test_helper'

class RecruitmentsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get recruitments_index_url
    assert_response :success
  end

end
