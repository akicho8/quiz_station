class ApplicationController < ActionController::Base
  if Rails.env.production?
    http_basic_authenticate_with name: "kotoba", password: "kotoba"
  end
end
