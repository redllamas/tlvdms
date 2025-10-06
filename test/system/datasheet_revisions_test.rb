require "application_system_test_case"

class DatasheetRevisionsTest < ApplicationSystemTestCase
  setup do
    @datasheet_revision = datasheet_revisions(:one)
  end

  test "visiting the index" do
    visit datasheet_revisions_url
    assert_selector "h1", text: "Datasheet revisions"
  end

  test "should create datasheet revision" do
    visit datasheet_revisions_url
    click_on "New datasheet revision"

    fill_in "Body", with: @datasheet_revision.body
    fill_in "Datasheet", with: @datasheet_revision.datasheet_id
    fill_in "Locale", with: @datasheet_revision.locale
    fill_in "Published at", with: @datasheet_revision.published_at
    fill_in "Region", with: @datasheet_revision.region
    fill_in "Render params", with: @datasheet_revision.render_params
    fill_in "Source template", with: @datasheet_revision.source_template
    fill_in "Status", with: @datasheet_revision.status
    fill_in "Version", with: @datasheet_revision.version
    click_on "Create Datasheet revision"

    assert_text "Datasheet revision was successfully created"
    click_on "Back"
  end

  test "should update Datasheet revision" do
    visit datasheet_revision_url(@datasheet_revision)
    click_on "Edit this datasheet revision", match: :first

    fill_in "Body", with: @datasheet_revision.body
    fill_in "Datasheet", with: @datasheet_revision.datasheet_id
    fill_in "Locale", with: @datasheet_revision.locale
    fill_in "Published at", with: @datasheet_revision.published_at.to_s
    fill_in "Region", with: @datasheet_revision.region
    fill_in "Render params", with: @datasheet_revision.render_params
    fill_in "Source template", with: @datasheet_revision.source_template
    fill_in "Status", with: @datasheet_revision.status
    fill_in "Version", with: @datasheet_revision.version
    click_on "Update Datasheet revision"

    assert_text "Datasheet revision was successfully updated"
    click_on "Back"
  end

  test "should destroy Datasheet revision" do
    visit datasheet_revision_url(@datasheet_revision)
    accept_confirm { click_on "Destroy this datasheet revision", match: :first }

    assert_text "Datasheet revision was successfully destroyed"
  end
end
