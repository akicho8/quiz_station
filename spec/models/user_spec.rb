require 'rails_helper'

RSpec.describe User, type: :model do
  it do
    assert create(:user)
  end
end
