enable :sessions

get '/' do
  # byebug
  erb :index
end

post '/login' do
  if User.authenticate(params[:email], params[:password]) != nil
    user = User.find_by(email: params[:email])
    # "session_id = " << session[:session_id]
    session[:id] = user.id
    redirect to('/login/secret_page')
  else
    redirect to('/')
  end
end

# get '/login/:session_id' do
#   erb :secret_page
# end

get '/login/secret_page' do
  if session[:id] != nil
    # "session_id = " << session[:session_id]
    erb :secret_page
  else
    redirect to('/')
  end
end

get '/logout' do
  session.clear
  redirect to('/')
end





# Logging in

# Redirecting a user back to the "log in" screen if they try to view the secret page without being logged in


# Logging out

# Creating an account

# Viewing the secret page
