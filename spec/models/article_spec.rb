require 'rails_helper'

RSpec.describe Article, type: :model do
  it do
    assert create(:article)
  end
end
