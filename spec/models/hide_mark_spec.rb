require 'rails_helper'

RSpec.describe HideMark, type: :model do
  it do
    assert create(:hide_mark)
  end
end
