get '/' do
  if session[:user_id]
    redirect '/user'
  else
    erb :'index/index'
  end
end

