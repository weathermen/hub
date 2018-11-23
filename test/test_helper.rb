ENV['RAILS_ENV'] ||= 'test'
require_relative '../config/environment'
require 'rails/test_help'

class ActiveSupport::TestCase
  # Setup all fixtures in test/fixtures/*.yml for all tests in alphabetical order.
  fixtures :all

  # Add more helper methods to be used by all tests here...
end

class ActionDispatch::IntegrationTest
  def sign_in(user, password)
    post user_session_path, params: {
      user: {
        email: user.email,
        password: password
      }
    }

    assert_redirected_to root_url
    assert_nil flash[:alert], flash[:alert]
    assert_equal I18n.t(:signed_in, scope: %i[devise sessions]), flash[:notice]
  end
end
