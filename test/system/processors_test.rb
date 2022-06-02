require "application_system_test_case"

class ProcessorsTest < ApplicationSystemTestCase
  setup do
    @processor = processors(:one)
  end

  test "visiting the index" do
    visit processors_url
    assert_selector "h1", text: "Processors"
  end

  test "should create processor" do
    visit processors_url
    click_on "New processor"

    click_on "Create Processor"

    assert_text "Processor was successfully created"
    click_on "Back"
  end

  test "should update Processor" do
    visit processor_url(@processor)
    click_on "Edit this processor", match: :first

    click_on "Update Processor"

    assert_text "Processor was successfully updated"
    click_on "Back"
  end

  test "should destroy Processor" do
    visit processor_url(@processor)
    click_on "Destroy this processor", match: :first

    assert_text "Processor was successfully destroyed"
  end
end
