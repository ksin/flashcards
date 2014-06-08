post '/login' do
  user=User.find_by(username: params[:username], password: params[:password])
  if user
    session[:user_id]=user.id
    redirect '/user'
  else
    redirect '/'
  end
end

post '/signup' do
  user=User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confiramtion])
  if user.save
    session[:user_id]=user.id
    redirect '/user'
  else
  redirect '/'
  end
end

get '/logout' do
  session.clear
  redirect '/'
end

get '/user' do
  erb :'user/userpage'
end