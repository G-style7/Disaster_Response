# frozen_string_literal: true

require "test_helper"

class Admin::HelpsControllerTest < ActionDispatch::IntegrationTest
  test "should get index" do
    get admin_helps_index_url
    assert_response :success
  end
end
