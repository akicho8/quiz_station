# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Mission, type: :model do
  before do
    Mission.destroy_all
  end

  it "作成" do
    Mission.create!(:question_body => "(question_body)", :tag_list => "tag1")
  end
end
