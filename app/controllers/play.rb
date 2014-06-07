get '/play/:id' do
  if session[:card_number] == 9
    redirect '/done'
  else
    deck = Deck.find(params[:id])
    @cards = deck.cards
    session[:card_number] ||= 0
    erb :'game/play', local: {card_number: session[:card_number], deck_id: params[:id]}
  end
end

post '/play/:id' do
  @deck = Deck.find(params[:id])
  @current_card = @deck.cards[session[:card_number]]
  if params[:answer] == @current_card.word
    @round = Round.find(session[:round_id])
    @round.correct += 1
    @correct? = true
  else
    @round.incorrect += 1
    @correct? = false
  end
  session[:card_number] += 1
  erb: :'game/answer'
end


get '/done' do
  @round = Round.find(session[:round_id])
  session[:card_numer] = nil
  erb :'game/done'
end
