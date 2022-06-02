require "test_helper"

class DeleteMesControllerTest < ActionDispatch::IntegrationTest
  setup do
    @delete_me = delete_mes(:one)
  end

  test "should get index" do
    get delete_mes_url
    assert_response :success
  end

  test "should get new" do
    get new_delete_me_url
    assert_response :success
  end

  test "should create delete_me" do
    assert_difference("DeleteMe.count") do
      post delete_mes_url, params: { delete_me: { somestring: @delete_me.somestring } }
    end

    assert_redirected_to delete_me_url(DeleteMe.last)
  end

  test "should show delete_me" do
    get delete_me_url(@delete_me)
    assert_response :success
  end

  test "should get edit" do
    get edit_delete_me_url(@delete_me)
    assert_response :success
  end

  test "should update delete_me" do
    patch delete_me_url(@delete_me), params: { delete_me: { somestring: @delete_me.somestring } }
    assert_redirected_to delete_me_url(@delete_me)
  end

  test "should destroy delete_me" do
    assert_difference("DeleteMe.count", -1) do
      delete delete_me_url(@delete_me)
    end

    assert_redirected_to delete_mes_url
  end
end
