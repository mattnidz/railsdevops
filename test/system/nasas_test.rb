require "application_system_test_case"

class NasasTest < ApplicationSystemTestCase
  setup do
    @nasa = nasas(:one)
  end

  test "visiting the index" do
    visit nasas_url
    assert_selector "h1", text: "Nasas"
  end

  test "creating a Nasa" do
    visit nasas_url
    click_on "New Nasa"

    fill_in "Api", with: @nasa.api
    fill_in "Url", with: @nasa.url
    click_on "Create Nasa"

    assert_text "Nasa was successfully created"
    click_on "Back"
  end

  test "updating a Nasa" do
    visit nasas_url
    click_on "Edit", match: :first

    fill_in "Api", with: @nasa.api
    fill_in "Url", with: @nasa.url
    click_on "Update Nasa"

    assert_text "Nasa was successfully updated"
    click_on "Back"
  end

  test "destroying a Nasa" do
    visit nasas_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Nasa was successfully destroyed"
  end
end
