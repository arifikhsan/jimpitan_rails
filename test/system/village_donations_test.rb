require "application_system_test_case"

class VillageDonationsTest < ApplicationSystemTestCase
  setup do
    @village_donation = village_donations(:one)
  end

  test "visiting the index" do
    visit village_donations_url
    assert_selector "h1", text: "Village Donations"
  end

  test "creating a Village donation" do
    visit village_donations_url
    click_on "New Village Donation"

    click_on "Create Village donation"

    assert_text "Village donation was successfully created"
    click_on "Back"
  end

  test "updating a Village donation" do
    visit village_donations_url
    click_on "Edit", match: :first

    click_on "Update Village donation"

    assert_text "Village donation was successfully updated"
    click_on "Back"
  end

  test "destroying a Village donation" do
    visit village_donations_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Village donation was successfully destroyed"
  end
end
