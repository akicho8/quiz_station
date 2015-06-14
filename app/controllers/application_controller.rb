class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  # if Rails.env.production?
  #   # http_basic_authenticate_with name: "kotoba", password: "kotoba"
  # 
  #   before_action do
  #     authenticate_or_request_with_http_basic do |name, password|
  #       name.to_s.match(/kotoba/) || password.to_s.match(/kotoba/)
  #     end
  #   end
  # end
end
