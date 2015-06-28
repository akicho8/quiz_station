require 'rails_helper'

RSpec.describe Book, type: :model do
  it do
    assert create(:book)
  end
end
