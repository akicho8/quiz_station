require 'rails_helper'

RSpec.describe HomesController, type: :controller do
  before do
    sign_in create(:user)
  end

  describe "GET #index" do
    it "returns http success" do
      get :index
      assert_response :success
    end
  end
end
