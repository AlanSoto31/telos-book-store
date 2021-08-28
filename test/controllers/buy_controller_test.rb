require 'test_helper'

class BuyControllerTest < ActionDispatch::IntegrationTest
  test 'should get new' do
    get buy_new_url
    assert_response :success
  end
end
