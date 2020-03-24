require 'test_helper'
require "time"

class TaskTest < ActiveSupport::TestCase
  def setup
    @user = users(:michael)
    @task = @user.tasks.build(content: "study rails", state: "doing", limit_date: Time.parse("2020/03/01 12:00") )
  end

  test "should be valid" do
    assert @task.valid?
  end

  test "user id should be present" do
    @task.user_id = nil
    assert_not @task.valid?
  end
  
  test "content should be present" do
    @task.content = "   "
    assert_not @task.valid?
  end
  
  test "state should be present" do
    @task.state = "   "
    assert_not @task.valid?
  end
  
  test "limit_date should be present" do
    @task.limit_date = "   "
    assert_not @task.valid?
  end

  test "content should be at most 140 characters" do
    @task.content = "a" * 31
    assert_not @task.valid?
  end
  
  test "order should be most recent first" do
    assert_equal tasks(:most_old), Task.first
  end
end
