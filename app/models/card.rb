class Card < ActiveRecord::Base
  validates :word, presence: true, uniqueness: true 
  validates :definition, presence: true, uniqueness: true 

  has_many :assemblies
  has_many :decks, through: :assemblies
end
