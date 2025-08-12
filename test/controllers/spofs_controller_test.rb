require "test_helper"

class SpofsControllerTest < ActionDispatch::IntegrationTest
  setup do
    @spof = spofs(:one)
  end

  test "should get index" do
    get spofs_url
    assert_response :success
  end

  test "should get new" do
    get new_spof_url
    assert_response :success
  end

  test "should create spof" do
    assert_difference("Spof.count") do
      post spofs_url, params: { spof: { label: @spof.label, name: @spof.name } }
    end

    assert_redirected_to spof_url(Spof.last)
  end

  test "should show spof" do
    get spof_url(@spof)
    assert_response :success
  end

  test "should get edit" do
    get edit_spof_url(@spof)
    assert_response :success
  end

  test "should update spof" do
    patch spof_url(@spof), params: { spof: { label: @spof.label, name: @spof.name } }
    assert_redirected_to spof_url(@spof)
  end

  test "should destroy spof" do
    assert_difference("Spof.count", -1) do
      delete spof_url(@spof)
    end

    assert_redirected_to spofs_url
  end
end
