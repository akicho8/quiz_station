class ImportantMark < ActiveRecord::Base
  belongs_to :user
  belongs_to :article

  with_options(presence: true) do |o|
    o.validates :user_id
    o.validates :article_id
  end
  with_options(allow_blank: true) do |o|
    o.validates :user_id, uniqueness: {scope: :article_id}
  end
end
