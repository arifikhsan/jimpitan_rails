require "test_helper"

class PatrolMembersControllerTest < ActionDispatch::IntegrationTest
  setup do
    @patrol_member = patrol_members(:one)
  end

  test "should get index" do
    get patrol_members_url
    assert_response :success
  end

  test "should get new" do
    get new_patrol_member_url
    assert_response :success
  end

  test "should create patrol_member" do
    assert_difference('PatrolMember.count') do
      post patrol_members_url, params: { patrol_member: {  } }
    end

    assert_redirected_to patrol_member_url(PatrolMember.last)
  end

  test "should show patrol_member" do
    get patrol_member_url(@patrol_member)
    assert_response :success
  end

  test "should get edit" do
    get edit_patrol_member_url(@patrol_member)
    assert_response :success
  end

  test "should update patrol_member" do
    patch patrol_member_url(@patrol_member), params: { patrol_member: {  } }
    assert_redirected_to patrol_member_url(@patrol_member)
  end

  test "should destroy patrol_member" do
    assert_difference('PatrolMember.count', -1) do
      delete patrol_member_url(@patrol_member)
    end

    assert_redirected_to patrol_members_url
  end
end
