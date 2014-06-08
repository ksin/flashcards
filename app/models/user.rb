class User < ActiveRecord::Base
  validates :username, presence: true, uniqueness: true
  validates :password, presence: true
  validates :password_confirmation, presence: true

  has_many :rounds
  has_many :decks, through: :rounds
  has_secure_password

end
