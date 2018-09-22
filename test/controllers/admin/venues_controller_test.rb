require 'test_helper'

class Admin::VenuesControllerTest < ActionDispatch::IntegrationTest
  test "should display venues index" do
    get admin_venues_url
    assert_response :success
    assert_select 'td', 'Mental crossfit'
  end

  test "should create an venue" do
    get new_admin_venue_url
    assert_response :success

    assert_difference('Venue.count', 1) do
      post admin_venues_url, params: { venue: { name: 'venue prueba', description: 'descripcion prueba', phone: '123456789' } }
    end
    assert_response :redirect
    follow_redirect!
    assert_response :success

    assert_select 'td', 'venue prueba'
  end

  test "should edit an venue" do
    venue = venues(:one)
    get edit_admin_venue_url(venue.id)
    assert_response :success
    patch admin_venue_url(venue), params: { venue: { name: 'other', description: 'descripcion prueba' } }
    assert_response :redirect
    follow_redirect!
    assert_response :success
    venue.reload

    assert venue.name, 'other'
  end

  test "should destroy an venue" do
    venue = venues(:one)
    assert_difference('Venue.count', -1) do
      delete admin_venue_url(venue)
    end
  end
end
