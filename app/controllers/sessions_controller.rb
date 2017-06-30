get '/sessions/new' do
  erb :'/sessions/new'
end

post '/sessions' do
  p params
  p params[:email]
  @user = User.find_by(email: params[:email])
  p "session"
  p @user[:id]
  p session[:user_id]
  if @user && @user.authenticate(params[:password])
    session[:user_id] = @user.user_id
    redirect "/users/#{user.id}"
  else
    @errors = ["Cannot log in. Password does not match"]
    erb :'sessions/new'
  end


end
