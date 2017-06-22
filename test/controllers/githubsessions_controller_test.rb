require 'test_helper'

class GithubsessionsControllerTest < ActionDispatch::IntegrationTest
  test "should get new" do
    get githubsessions_new_url
    assert_response :success
  end

  test "should get create" do
    get githubsessions_create_url
    assert_response :success
  end

  test "should get destroy" do
    get githubsessions_destroy_url
    assert_response :success
  end

end
