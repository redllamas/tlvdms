require "application_system_test_case"

class DatasheetsTest < ApplicationSystemTestCase
  setup do
    @datasheet = datasheets(:one)
  end

  test "visiting the index" do
    visit datasheets_url
    assert_selector "h1", text: "Datasheets"
  end

  test "should create datasheet" do
    visit datasheets_url
    click_on "New datasheet"

    fill_in "Doc no", with: @datasheet.doc_no
    fill_in "Status", with: @datasheet.status
    fill_in "Title", with: @datasheet.title
    click_on "Create Datasheet"

    assert_text "Datasheet was successfully created"
    click_on "Back"
  end

  test "should update Datasheet" do
    visit datasheet_url(@datasheet)
    click_on "Edit this datasheet", match: :first

    fill_in "Doc no", with: @datasheet.doc_no
    fill_in "Status", with: @datasheet.status
    fill_in "Title", with: @datasheet.title
    click_on "Update Datasheet"

    assert_text "Datasheet was successfully updated"
    click_on "Back"
  end

  test "should destroy Datasheet" do
    visit datasheet_url(@datasheet)
    accept_confirm { click_on "Destroy this datasheet", match: :first }

    assert_text "Datasheet was successfully destroyed"
  end
end
