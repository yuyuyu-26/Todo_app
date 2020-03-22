require 'test_helper'

class StartPagesControllerTest < ActionDispatch::IntegrationTest
  def setup
    @base_title = "Todo_app"
  end
  
  test "should get root" do
    get root_url
    assert_response :success
  end
  
  test "should get home" do
    get root_path
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get help_path
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end
  
  test "should get about" do
    get about_path
    assert_response :success
    assert_select "title", "概要 | #{@base_title}"
  end
  
  test "should get contact" do
    get contact_path
    assert_response :success
    assert_select "title", "お問い合わせ | #{@base_title}"
  end

end
