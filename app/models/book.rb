class Book < ActiveRecord::Base
  belongs_to :user
  has_many :articles, dependent: :destroy

  with_options(presence: true) do |o|
    o.validates :user_id
    o.validates :name
  end
  with_options(allow_blank: true) do |o|
    o.validates :name, uniqueness: {scope: :user_id}
  end
end
