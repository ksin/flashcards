### UrbanDictionary required in environment and placed in helper class. Should work in the seed now.

# Example usage: 
# u = UrbanDictionary.new
# deepfave = u.get_top_definition("deepfave")
#
# card = Card.create(word: deepfave[:term], definition: deepfave[:definition])
# deck = Deck.find(some_deck_id)
# deck.cards << card