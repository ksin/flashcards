class Deck < ActiveRecord::Base
  validates :name, presence: true 

  has_many :assemblies
  has_many :cards, through: :assemblies
  has_many :rounds
  has_many :users, through: :rounds 
end
