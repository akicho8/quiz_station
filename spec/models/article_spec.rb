# -*- coding: utf-8 -*-
require 'rails_helper'

RSpec.describe Article, type: :model do
  before do
    Article.destroy_all
  end

  it "作成" do
    Article.create!(:question_body => "(question_body)", :tag_list => "tag1")
  end
end
