class Article < ActiveRecord::Base
  acts_as_taggable
  acts_as_taggable_on :category_tags

  belongs_to :book

  has_many :answer_logs, dependent: :destroy
  has_many :users, dependent: :destroy, through: :answer_logs

  before_validation do
    if changes.has_key?(:question_body)
      self.question_body = question_body.to_s.strip.presence
    end
    true
  end

  with_options(presence: true) do |o|
    o.validates :question_body
  end
  with_options(allow_blank: true) do |o|
    o.validates :question_body, uniqueness: {scope: :book_id}
  end

  def v_question_body(difficult_level_key)
    difficult_level_info = DifficultLevelInfo[difficult_level_key || :normal]
    question_body.gsub(/\(.*?\)/) {|str|
      chars = str.chars
      chars = chars[1..-2]
      chars = difficult_level_info.chars_shadow.call(chars)
      # # str = [chars.first, "？" * (chars.size - 1)].join
      # # str = "？" * chars.size
      # str = chars_shadow(chars.join, 2)
      "<span class='question_strong'>#{chars.join}</span>"
    }.html_safe
  end

  def v_answer_body
    question_body.gsub(/\(.*?\)/) {|str|
      chars = str.chars
      chars = chars[1..-2]
      str = chars.join
      "<span class='answer_strong'>#{str}</span>"
    }.html_safe
  end

  # private
  # 
  # # str を全部 "？" にして、 hint 個数だけを見せる
  # def chars_shadow(str, hint)
  #   chars = str.chars
  #   i = rand(chars.size)
  #   a = Array.new(chars.size, "？")
  #   if hint > chars.size - 1
  #     hint = chars.size - 1
  #   end
  #   indexes = (0...a.size).to_a.sample(hint)
  #   indexes.each {|i| a[i] = chars[i] }
  #   a.join
  # end
end
