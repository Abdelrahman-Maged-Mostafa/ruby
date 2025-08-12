require "application_system_test_case"

class SpofsTest < ApplicationSystemTestCase
  setup do
    @spof = spofs(:one)
  end

  test "visiting the index" do
    visit spofs_url
    assert_selector "h1", text: "Spofs"
  end

  test "should create spof" do
    visit spofs_url
    click_on "New spof"

    fill_in "Label", with: @spof.label
    fill_in "Name", with: @spof.name
    click_on "Create Spof"

    assert_text "Spof was successfully created"
    click_on "Back"
  end

  test "should update Spof" do
    visit spof_url(@spof)
    click_on "Edit this spof", match: :first

    fill_in "Label", with: @spof.label
    fill_in "Name", with: @spof.name
    click_on "Update Spof"

    assert_text "Spof was successfully updated"
    click_on "Back"
  end

  test "should destroy Spof" do
    visit spof_url(@spof)
    click_on "Destroy this spof", match: :first

    assert_text "Spof was successfully destroyed"
  end
end
