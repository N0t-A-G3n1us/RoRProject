require "application_system_test_case"

class InviteRequestsTest < ApplicationSystemTestCase
  setup do
    @invite_request = invite_requests(:one)
  end

  test "visiting the index" do
    visit invite_requests_url
    assert_selector "h1", text: "Invite Requests"
  end

  test "creating a Invite request" do
    visit invite_requests_url
    click_on "New Invite Request"

    click_on "Create Invite request"

    assert_text "Invite request was successfully created"
    click_on "Back"
  end

  test "updating a Invite request" do
    visit invite_requests_url
    click_on "Edit", match: :first

    click_on "Update Invite request"

    assert_text "Invite request was successfully updated"
    click_on "Back"
  end

  test "destroying a Invite request" do
    visit invite_requests_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Invite request was successfully destroyed"
  end
end
