require "test_helper"

class DatasheetRevisionsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datasheet_revision = datasheet_revisions(:one)
  end

  test "should get index" do
    get datasheet_revisions_url
    assert_response :success
  end

  test "should get new" do
    get new_datasheet_revision_url
    assert_response :success
  end

  test "should create datasheet_revision" do
    assert_difference("DatasheetRevision.count") do
      post datasheet_revisions_url, params: { datasheet_revision: { body: @datasheet_revision.body, datasheet_id: @datasheet_revision.datasheet_id, locale: @datasheet_revision.locale, published_at: @datasheet_revision.published_at, region: @datasheet_revision.region, render_params: @datasheet_revision.render_params, source_template: @datasheet_revision.source_template, status: @datasheet_revision.status, version: @datasheet_revision.version } }
    end

    assert_redirected_to datasheet_revision_url(DatasheetRevision.last)
  end

  test "should show datasheet_revision" do
    get datasheet_revision_url(@datasheet_revision)
    assert_response :success
  end

  test "should get edit" do
    get edit_datasheet_revision_url(@datasheet_revision)
    assert_response :success
  end

  test "should update datasheet_revision" do
    patch datasheet_revision_url(@datasheet_revision), params: { datasheet_revision: { body: @datasheet_revision.body, datasheet_id: @datasheet_revision.datasheet_id, locale: @datasheet_revision.locale, published_at: @datasheet_revision.published_at, region: @datasheet_revision.region, render_params: @datasheet_revision.render_params, source_template: @datasheet_revision.source_template, status: @datasheet_revision.status, version: @datasheet_revision.version } }
    assert_redirected_to datasheet_revision_url(@datasheet_revision)
  end

  test "should destroy datasheet_revision" do
    assert_difference("DatasheetRevision.count", -1) do
      delete datasheet_revision_url(@datasheet_revision)
    end

    assert_redirected_to datasheet_revisions_url
  end
end
