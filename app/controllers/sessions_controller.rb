get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  @user = User.find_by(email: params[:email])
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.user_id
    redirect "/users/#{user.id}"
  else
    @errors = ["Cannot log in. Password does not match"]
    erb :'sessions/new'
  end
end
