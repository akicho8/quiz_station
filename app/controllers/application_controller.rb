class ApplicationController < ActionController::Base
  before_action do
    sign_in User.first
  end

  before_action :authenticate_user!

  if Rails.env.production?
    if v = ENV["HTTP_BASIC_AUTHENTICATE"].presence
      name, password = v.split(/:/)
      http_basic_authenticate_with name: name, password: password
    end
    # before_action do
    #   authenticate_or_request_with_http_basic do |name, password|
    #     name.to_s.match(/a/) || password.to_s.match(/a/)
    #   end
    # end
  end
end
