post '/login' do
  user=User.find_by(username: params[:username]).try(:authenticate, params[:password])
  if user
    session[:user_id]=user.id
    redirect '/user'
  else
    redirect '/'
  end
end

post '/signup' do
  @user=User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation])
  if @user.save
    session[:user_id]=@user.id
    @user=User.find(session[:user_id])
    @decks = Deck.all
    @rounds = @user.rounds
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
  @user=User.find(session[:user_id])
  @decks = Deck.all
  @rounds = @user.rounds
  erb :'user/userpage'
end
