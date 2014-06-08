<<<<<<< HEAD
100.times do 
  Card.create(word: 'deepfave', definition: UrbanDictionary::get_top_definition('deepfave'))
end 

words = ['deepfave', 'craydar', 'tweleb', 'Snelfie', 'brotherzone', 'harassenger', 'wikipedant', 
         'gonser', 'whitespoken', 'textpergers', 'arhcivist', 'sharkology', 'mandate', 'twincrest',
         'selfiebombing', 'saltdaddy', 'lurper', 'twerking', 'stunning', 'trimmigrants', 'technocamping',
         'cyberbaiting', 'jeenyus', 'neckbeard', 'horsrus'
        ]
=======
### UrbanDictionary required in environment and placed in helper class. Should work in the seed now.

# Example usage: 
# u = UrbanDictionary.new
# deepfave = u.get_top_definition("deepfave")
#
# card = Card.create(word: deepfave[:term], definition: deepfave[:definition])
# deck = Deck.find(some_deck_id)
# deck.cards << card
>>>>>>> 3bbb070bba076fee3115864b70abb6e66e98e43d
