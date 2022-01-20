require "test_helper"

class InstitutionControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get institution_index_url
    assert_response :success
  end

  test "should get show" do
    get institution_show_url
    assert_response :success
  end

  test "should get update" do
    get institution_update_url
    assert_response :success
  end

  test "should get delete" do
    get institution_delete_url
    assert_response :success
  end
end
