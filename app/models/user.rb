class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable

  has_many :answer_logs, dependent: :destroy
  has_many :answered_articles, dependent: :destroy, through: :answer_logs, source: :article

  has_many :hide_marks, dependent: :destroy
  has_many :marked_articles, dependent: :destroy, through: :hide_marks, source: :article

  has_many :books, :dependent => :destroy
end
