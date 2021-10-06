require "test_helper"

class VillageDonationsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @village_donation = village_donations(:one)
  end

  test "should get index" do
    get village_donations_url
    assert_response :success
  end

  test "should get new" do
    get new_village_donation_url
    assert_response :success
  end

  test "should create village_donation" do
    assert_difference('VillageDonation.count') do
      post village_donations_url, params: { village_donation: {  } }
    end

    assert_redirected_to village_donation_url(VillageDonation.last)
  end

  test "should show village_donation" do
    get village_donation_url(@village_donation)
    assert_response :success
  end

  test "should get edit" do
    get edit_village_donation_url(@village_donation)
    assert_response :success
  end

  test "should update village_donation" do
    patch village_donation_url(@village_donation), params: { village_donation: {  } }
    assert_redirected_to village_donation_url(@village_donation)
  end

  test "should destroy village_donation" do
    assert_difference('VillageDonation.count', -1) do
      delete village_donation_url(@village_donation)
    end

    assert_redirected_to village_donations_url
  end
end
