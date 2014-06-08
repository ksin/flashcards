### UrbanDictionary required in environment and placed in helper class. Should work in the seed now.

# Example usage:
# u = UrbanDictionary.new
# deepfave = u.get_top_definition('deepfave')
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

words = ['deepfave', 'mom-com', 'tweleb']

 #         'manscheduling', 'Snelfie', 'brotherzone', 'harassenger', 'wikipedant',
 #         'shweeting', 'Wantrepreneur', 'technocamping', 'neckbeard', 'postboned', 'Bae', 'Fappy', 'sportgasm',
 #         'Spectaphile', 'Mastabbatical', 'Cameragoer', 'Eggnogling', 'bangorrhea', 'inboxia', 'Misophonia',
 #         'Rosterbating', 'Overcupensating', 'crackstituents', 'peefurbished', 'motorfloating',
 #         'stealership', 'niplash', 'antistalking', 'charger-challenged', 'anglo-klaxon', 'fapidextrous', 'presstitute',
 #         'backspray', 'congressing', 'crosstext', 'literally', 'phoneslinger', 'thriftster', 'Emotionap', 'textretary',
 #         'Nocializing', 'craydar', 'Spom'

sports = ['schnide', 'sportgasm', 'Rosterbating', 'poofball', 'athleholic']
technology = ['wikipedant', 'inboxia', 'deepfave', 'phoneslinger', 'charger-challenged']
lewd = ['postboned', 'fapidextrous', 'shweeting', 'Mastabbatical', 'motorfloating']
potpourri = ['neckbeard', 'Bae', 'Fappy', 'craydar', 'literally']
social = ['brotherzone', 'Cameragoer', 'thriftster', 'Nocializing', 'crosstext']


dict = UrbanDictionary.new
# sport_cards = []
# tech_cards = []
# lewd_cards = []
# potpourri_cards = []
# social_cards = []

sports_deck = Deck.create(name: "Sports")
tech_deck = Deck.create(name: "Technology")
lewd_deck = Deck.create(name: "Lewd")
potpourri_deck = Deck.create(name: "Potpourri")
social_deck = Deck.create(name: "Social")

sports.each do |word|
  sports_deck.cards << Card.create(word: dict.get_top_definition(word)[:term].downcase, definition:dict.get_top_definition(word)[:definition])
end
technology.each do |word|
  tech_deck.cards << Card.create(word: dict.get_top_definition(word)[:term].downcase, definition:dict.get_top_definition(word)[:definition])
end
lewd.each do |word|
  lewd_deck.cards << Card.create(word: dict.get_top_definition(word)[:term].downcase, definition:dict.get_top_definition(word)[:definition])
end
potpourri.each do |word|
  potpourri_deck.cards << Card.create(word: dict.get_top_definition(word)[:term].downcase, definition:dict.get_top_definition(word)[:definition])
end
social.each do |word|
  social_deck.cards << Card.create(word: dict.get_top_definition(word)[:term].downcase, definition:dict.get_top_definition(word)[:definition])
end

# word_objects.each do |word_obj|
#   all_cards << Card.create(word: word_obj[:term].downcase, definition: word_obj[:definition])
# end



# new_deck = Deck.new(name: "All")
# new_deck.save

# all_cards.each do |ex_card|
#   new_deck.cards << ex_card
# end
