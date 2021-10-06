require "application_system_test_case"

class PatrolMembersTest < ApplicationSystemTestCase
  setup do
    @patrol_member = patrol_members(:one)
  end

  test "visiting the index" do
    visit patrol_members_url
    assert_selector "h1", text: "Patrol Members"
  end

  test "creating a Patrol member" do
    visit patrol_members_url
    click_on "New Patrol Member"

    click_on "Create Patrol member"

    assert_text "Patrol member was successfully created"
    click_on "Back"
  end

  test "updating a Patrol member" do
    visit patrol_members_url
    click_on "Edit", match: :first

    click_on "Update Patrol member"

    assert_text "Patrol member was successfully updated"
    click_on "Back"
  end

  test "destroying a Patrol member" do
    visit patrol_members_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Patrol member was successfully destroyed"
  end
end
