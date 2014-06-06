post '/login' do
  redirect '/user'
end

post '/signup' do
  redirect '/user'
end

post '/logout' do

  redirect '/'
end

get '/user' do
  erb :'user/userpage'
end