require 'rails_helper'

RSpec.describe ImportantMark, type: :model do
  it do
    assert create(:important_mark)
  end
end
