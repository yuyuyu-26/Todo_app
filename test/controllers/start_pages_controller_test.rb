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
    get start_pages_home_url
    assert_response :success
    assert_select "title", "#{@base_title}"
  end

  test "should get help" do
    get start_pages_help_url
    assert_response :success
    assert_select "title", "ヘルプ | #{@base_title}"
  end
  
  test "should get about" do
    get start_pages_about_url
    assert_response :success
    assert_select "title", "概要 | #{@base_title}"
  end
  
  test "should get contact" do
    get start_pages_contact_url
    assert_response :success
    assert_select "title", "お問い合わせ | #{@base_title}"
  end

end
