require 'test_helper'

class SuccoursControllerTest < ActionDispatch::IntegrationTest
  setup do
    @succour = succours(:one)
  end

  test "should get index" do
    get succours_url
    assert_response :success
  end

  test "should get new" do
    get new_succour_url
    assert_response :success
  end

  test "should create succour" do
    assert_difference('Succour.count') do
      post succours_url, params: { succour: { code: @succour.code, course: @succour.course, level: @succour.level, question: @succour.question, slug: @succour.slug, task: @succour.task } }
    end

    assert_redirected_to succour_url(Succour.last)
  end

  test "should show succour" do
    get succour_url(@succour)
    assert_response :success
  end

  test "should get edit" do
    get edit_succour_url(@succour)
    assert_response :success
  end

  test "should update succour" do
    patch succour_url(@succour), params: { succour: { code: @succour.code, course: @succour.course, level: @succour.level, question: @succour.question, slug: @succour.slug, task: @succour.task } }
    assert_redirected_to succour_url(@succour)
  end

  test "should destroy succour" do
    assert_difference('Succour.count', -1) do
      delete succour_url(@succour)
    end

    assert_redirected_to succours_url
  end
end
