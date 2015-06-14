require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    assert create(:user)
    # @user = User.new(:email => "user1@localhost.net", :password => "(password)")
    # @user.valid?
    # @user.errors.full_messages.should == []
  end
end
