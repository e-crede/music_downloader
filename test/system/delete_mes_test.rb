require "application_system_test_case"

class DeleteMesTest < ApplicationSystemTestCase
  setup do
    @delete_me = delete_mes(:one)
  end

  test "visiting the index" do
    visit delete_mes_url
    assert_selector "h1", text: "Delete mes"
  end

  test "should create delete me" do
    visit delete_mes_url
    click_on "New delete me"

    fill_in "Somestring", with: @delete_me.somestring
    click_on "Create Delete me"

    assert_text "Delete me was successfully created"
    click_on "Back"
  end

  test "should update Delete me" do
    visit delete_me_url(@delete_me)
    click_on "Edit this delete me", match: :first

    fill_in "Somestring", with: @delete_me.somestring
    click_on "Update Delete me"

    assert_text "Delete me was successfully updated"
    click_on "Back"
  end

  test "should destroy Delete me" do
    visit delete_me_url(@delete_me)
    click_on "Destroy this delete me", match: :first

    assert_text "Delete me was successfully destroyed"
  end
end
