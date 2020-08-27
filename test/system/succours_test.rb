require "application_system_test_case"

class SuccoursTest < ApplicationSystemTestCase
  setup do
    @succour = succours(:one)
  end

  test "visiting the index" do
    visit succours_url
    assert_selector "h1", text: "Succours"
  end

  test "creating a Succour" do
    visit succours_url
    click_on "New Succour"

    fill_in "Code", with: @succour.code
    fill_in "Course", with: @succour.course
    fill_in "Level", with: @succour.level
    fill_in "Question", with: @succour.question
    fill_in "Slug", with: @succour.slug
    fill_in "Task", with: @succour.task
    click_on "Create Succour"

    assert_text "Succour was successfully created"
    click_on "Back"
  end

  test "updating a Succour" do
    visit succours_url
    click_on "Edit", match: :first

    fill_in "Code", with: @succour.code
    fill_in "Course", with: @succour.course
    fill_in "Level", with: @succour.level
    fill_in "Question", with: @succour.question
    fill_in "Slug", with: @succour.slug
    fill_in "Task", with: @succour.task
    click_on "Update Succour"

    assert_text "Succour was successfully updated"
    click_on "Back"
  end

  test "destroying a Succour" do
    visit succours_url
    page.accept_confirm do
      click_on "Destroy", match: :first
    end

    assert_text "Succour was successfully destroyed"
  end
end
