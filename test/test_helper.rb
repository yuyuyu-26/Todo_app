ENV['RAILS_ENV'] ||= 'test'
require File.expand_path('../../config/environment', __FILE__)
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # テストユーザーがログイン中の場合にtrueを返す
  def is_logged_in? #logged_inと混同しないよう
    !session[:user_id].nil?  #ヘルパーメソッドはテストから呼び出せない(current_userじゃなくてsession使用)
  end
end
