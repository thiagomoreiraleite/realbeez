require 'test_helper'

class TarifsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get tarifs_index_url
    assert_response :success
  end

end
