get '/play/:id' do
  erb :'game/play'
end

post '/play/:id' do
  redirect "/play/params[:id]/answer"
end


get '/done' do
  erb :'game/done'
end

get 'play/:id/answer/' do
  erb :'game/answer'
end