require 'rails_helper'

RSpec.describe AnswerLog, type: :model do
  it do
    assert create(:answer_log)
  end
end
