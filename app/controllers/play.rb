get '/play/:id' do
  deck = Deck.find(params[:id])
  user = User.find(session[:user_id])
  user.decks << deck
  round = Round.find_by(user_id: user.id, deck_id: deck.id)
  round.correct = 0
  round.incorrect = 0
  round.save
  @cards = deck.cards
  session[:round_id] = round.id
  session[:card_number] ||= 0
  erb :'game/play', locals: {card_number: session[:card_number], deck_id: params[:id]}
end

get '/play/:id/next' do
  if session[:card_number] == 5
    redirect '/done'
  else
    deck = Deck.find(params[:id])
    @cards = deck.cards
    session[:card_number] ||= 0
    erb :'game/play', locals: {card_number: session[:card_number], deck_id: params[:id]}
  end
end

post '/play/:id' do
  @deck = Deck.find(params[:id])
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


get '/done' do
  @round = Round.find(session[:round_id])
  session[:card_number] = nil
  session[:round_id] = nil
  erb :'game/done'
end
