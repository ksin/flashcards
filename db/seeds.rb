### UrbanDictionary required in environment and placed in helper class. Should work in the seed now.

# Example usage:
# u = UrbanDictionary.new
# deepfave = u.get_top_definition("deepfave")
#
# card = Card.create(word: deepfave[:term], definition: deepfave[:definition])
# deck = Deck.find(some_deck_id)
# deck.cards << card

Round.destroy_all
User.destroy_all
Card.destroy_all
Deck.destroy_all

User.create(username:'Jake', password:'jake', password_confirmation:'jake')
User.create(username:'Ken', password:'jake', password_confirmation:'jake')
User.create(username:'Mario', password:'jake', password_confirmation:'jake')
User.create(username:'John', password:'jake', password_confirmation:'jake')
User.create(username:'Tim', password:'jake', password_confirmation:'jake')

theme1 = Deck.create(name:)
Deck.create(name:)
Deck.create(name:)
Deck.create(name:)
Deck.create(name:)

theme1.cards <<

words = ['deepfave', 'mom-com', 'tweleb']

 # 'manscheduling', 'Snelfie', 'brotherzone', 'harassenger', 'wikipedant',
 #         'shweeting', 'Wantrepreneur', 'technocamping', 'neckbeard', 'postboned', 'Bae', 'Fappy', 'sportgasm',
 #         'Spectaphile', 'Mastabbatical', 'Cameragoer', 'Eggnogling', 'bangorrhea', 'inboxia', 'Misophonia',
 #         'Rosterbating', 'Overcupensating', 'crackstituents', 'peefurbished', 'motorfloating',
 #         'stealership', 'niplash', 'antistalking', 'charger-challenged', 'anglo-klaxon', 'fapidextrous', 'presstitute',
 #         'backspray', 'congressing', 'crosstext', 'literally', 'phoneslinger', 'thriftster', 'Emotionap', 'textretary',
 #         'Nocializing', 'craydar',

dict = UrbanDictionary.new
word_objects = []
all_cards = []
deck = []
words.each do |word|
  word_objects << dict.get_top_definition(word)
end

word_objects.each do |word_obj|
  all_cards << Card.create(word: word_obj[:term].downcase, definition: word_obj[:definition])
end

new_deck = Deck.new(name: "All")
new_deck.save

all_cards.each do |ex_card|
  new_deck.cards << ex_card
end
