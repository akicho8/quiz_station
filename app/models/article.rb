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

  with_options(presence: true) do
    validates :question_body
  end
  with_options(allow_blank: true) do
    validates :question_body, uniqueness: {scope: :book_id}
  end

  def v_question_body(difficult_level_key)
    difficult_level_info = DifficultLevelInfo[difficult_level_key || :normal]
    question_body.gsub(/\(.*?\)/) {|str|
      chars = str.chars
      chars = chars[1..-2]
      chars = difficult_level_info.chars_shadow.call(chars)
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
end
