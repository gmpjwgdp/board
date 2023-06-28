require 'test_helper'

class TopicControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get topic_index_url
    assert_response :success
  end

  test "should get create" do
    get topic_create_url
    assert_response :success
  end

end
