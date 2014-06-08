get '/play' do
  if session[:card_number]
    deck = Deck.find(session[:deck_id])
    @cards = deck.cards
    @msg = "You're playing a game already with the #{deck.name} deck. Finish your round first before starting a new one."
    erb :'game/play', locals: {card_number: session[:card_number], deck_id: session[:deck_id]}
  else
    deck = Deck.find(params[:deck_id])
    user = User.find(session[:user_id])
    session[:deck_id] = params[:deck_id]
    user.decks << deck
    round = Round.find_by(user_id: user.id, deck_id: deck.id)
    session[:round_id] = round.id
    round.correct = 0
    round.incorrect = 0
    round.save
    @cards = deck.cards
    session[:card_number] = 0
    erb :'game/play', locals: {card_number: session[:card_number], deck_id: session[:deck_id]}
  end
end

post '/play' do
  @deck = Deck.find(session[:deck_id])
  @current_card = @deck.cards[session[:card_number]]
  @round = Round.find(session[:round_id])
  if params[:answer].downcase == @current_card.word
    @round.correct += 1
    @round.save
    @correctness = true
  else
    @round.incorrect += 1
    @round.save
    @correctness = false
  end
  session[:card_number] += 1
  erb :'game/answer'
end

get '/play/next' do
  if session[:card_number] == 5
    redirect '/done'
  else
    deck = Deck.find(session[:deck_id])
    @cards = deck.cards
    erb :'game/play', locals: {card_number: session[:card_number], deck_id: session[:deck_id]}
  end
end

get '/done' do
  @round = Round.find(session[:round_id])
  session[:card_number] = nil
  session[:round_id] = nil
  session[:deck_id] = nil
  erb :'game/done'
end
