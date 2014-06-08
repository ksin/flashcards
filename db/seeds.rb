### UrbanDictionary required in environment and placed in helper class. Should work in the seed now.

# Example usage:
# u = UrbanDictionary.new
# deepfave = u.get_top_definition('deepfave')
#
# card = Card.create(word: deepfave[:term], definition: deepfave[:definition])
# deck = Deck.find(some_deck_id)
# deck.cards << card

def add_linebreaks(definition)
  definition.gsub("\r", '<br>')
end

Round.destroy_all
User.destroy_all
Card.destroy_all
Deck.destroy_all

User.create(username:'Jake', password:'jake', password_confirmation:'jake')
User.create(username:'Ken', password:'jake', password_confirmation:'jake')
User.create(username:'Mario', password:'jake', password_confirmation:'jake')
User.create(username:'John', password:'jake', password_confirmation:'jake')
User.create(username:'Tim', password:'jake', password_confirmation:'jake')

sports = ['schnide', 'sportgasm', 'Rosterbating', 'poofball', 'athleholic']
technology = ['wikipedant', 'inboxia', 'deepfave', 'phoneslinger', 'charger-challenged']
lewd = ['postboned', 'fapidextrous', 'shweeting', 'Mastabbatical', 'motorfloating']
potpourri = ['neckbeard', 'Bae', 'Fappy', 'craydar', 'literally']
social = ['brotherzone', 'Cameragoer', 'yolo', 'Nocializing', 'crosstext']

dict = UrbanDictionary.new

sports_deck = Deck.create(name: "Sports")
tech_deck = Deck.create(name: "Technology")
lewd_deck = Deck.create(name: "Lewd")
potpourri_deck = Deck.create(name: "Potpourri")
social_deck = Deck.create(name: "Social")

sports.each do |word|
  w = dict.get_top_definition(word)
  sports_deck.cards << Card.create(word: w[:term].downcase, definition:add_linebreaks(dict.get_top_definition(word)[:definition]))
end
technology.each do |word|
  w = dict.get_top_definition(word)
  tech_deck.cards << Card.create(word: w[:term].downcase, definition:add_linebreaks(w[:definition]))
end
lewd.each do |word|
  w = dict.get_top_definition(word)
  lewd_deck.cards << Card.create(word: w[:term].downcase, definition:add_linebreaks(w[:definition]))
end
potpourri.each do |word|
  w = dict.get_top_definition(word)
  potpourri_deck.cards << Card.create(word: w[:term].downcase, definition:add_linebreaks(w[:definition]))
end
social.each do |word|
  w = dict.get_top_definition(word)
  social_deck.cards << Card.create(word: w[:term].downcase, definition:add_linebreaks(w[:definition]))
end
