require 'test_helper'

class Api::V1::UnitMeasureControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get api_v1_unit_meassure_index_url
    assert_response :success
  end

  test "should get new" do
    get api_v1_unit_meassure_new_url
    assert_response :success
  end

  test "should get create" do
    get api_v1_unit_meassure_create_url
    assert_response :success
  end

  test "should get show" do
    get api_v1_unit_meassure_show_url
    assert_response :success
  end

  test "should get delete" do
    get api_v1_unit_meassure_delete_url
    assert_response :success
  end

end
