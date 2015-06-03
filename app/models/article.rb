# -*- coding: utf-8 -*-

class Article < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :category_tags

  before_validation do
    self.answered_counter ||= 0
    self.important_flag = false if important_flag.nil?

    if changes.has_key?(:question_body)
      self.question_body = question_body.to_s.strip.presence
    end

    true
  end

  with_options(:presence => true) do |o|
    o.validates :question_body
  end
  with_options(:allow_blank => true) do |o|
    o.validates :question_body, :uniqueness => true
  end

  def question_body2
    question_body.gsub(/\(.*\)/) {|str|
      chars = str.chars
      chars = chars[1..-2]
      if false
        str = [chars.first, "？" * (chars.size - 1)].join
      else
        str = "？" * chars.size
      end
      "<span class='question_strong'>#{str}</span>".html_safe
    }.html_safe
  end

  def answer_body2
    question_body.gsub(/\(.*\)/) {|str|
      chars = str.chars
      chars = chars[1..-2]
      "<span class='answer_strong'>#{chars.join}</span>"
    }.html_safe
  end
end