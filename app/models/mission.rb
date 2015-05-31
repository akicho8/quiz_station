# -*- coding: utf-8 -*-

class Mission < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :category_tags

  before_validation do
    self.display_counter ||= 0
    self.difficult_level ||= 0
    self.foobar_counter ||= 0
    self.foobar_flag = false if foobar_flag.nil?

    if changes.has_key?(:question_body)
      self.question_body = question_body.to_s.strip.presence
    end
    if changes.has_key?(:answer_body)
      self.answer_body = answer_body.to_s.strip.presence
    end
    true
  end

  with_options(:presence => true) do |o|
    o.validates :question_body
    o.validates :answer_body
  end
  with_options(:allow_blank => true) do |o|
    o.validates :question_body, :uniqueness => true
  end
end
