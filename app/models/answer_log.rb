class AnswerLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  with_options(presence: true) do |o|
    o.validates :user_id
    o.validates :article_id
  end
end
