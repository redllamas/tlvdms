require "test_helper"

class DatasheetsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @datasheet = datasheets(:one)
  end

  test "should get index" do
    get datasheets_url
    assert_response :success
  end

  test "should get new" do
    get new_datasheet_url
    assert_response :success
  end

  test "should create datasheet" do
    assert_difference("Datasheet.count") do
      post datasheets_url, params: { datasheet: { doc_no: @datasheet.doc_no, status: @datasheet.status, title: @datasheet.title } }
    end

    assert_redirected_to datasheet_url(Datasheet.last)
  end

  test "should show datasheet" do
    get datasheet_url(@datasheet)
    assert_response :success
  end

  test "should get edit" do
    get edit_datasheet_url(@datasheet)
    assert_response :success
  end

  test "should update datasheet" do
    patch datasheet_url(@datasheet), params: { datasheet: { doc_no: @datasheet.doc_no, status: @datasheet.status, title: @datasheet.title } }
    assert_redirected_to datasheet_url(@datasheet)
  end

  test "should destroy datasheet" do
    assert_difference("Datasheet.count", -1) do
      delete datasheet_url(@datasheet)
    end

    assert_redirected_to datasheets_url
  end
end
