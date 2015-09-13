class AnswerLog < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  with_options(presence: true) do
    validates :user_id
    validates :article_id
  end
end
