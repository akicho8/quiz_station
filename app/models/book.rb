class Book < ActiveRecord::Base
  belongs_to :user
  has_many :articles, dependent: :destroy

  with_options(presence: true) do
    validates :user_id
    validates :name
  end
  with_options(allow_blank: true) do
    validates :name, uniqueness: {scope: :user_id}
  end
end
