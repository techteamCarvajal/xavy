require 'test_helper'

class VenuesControllerTest < ActionDispatch::IntegrationTest
  test "should display venues index" do
    get root_url
    assert_response :success
    assert_select 'h5', 'Mental crossfit'
  end

  test "should display venue page from index" do
    get venue_url(venues(:one))
    assert_response :success
    assert_select 'h1', 'Mental crossfit'
    assert_select 'h5', 'Clase de crossfit'
  end
end
