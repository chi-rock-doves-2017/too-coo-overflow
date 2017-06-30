get '/answers/new' do
  redirect '/' unless logged_in?
  erb :'answers/new'
end

post '/answers' do
  new_answer = Answer.new(params[:answer])
  new_answer.user = current_user
  if new_answer.save
    @alerts = ["Thanks for your answer!"]
    redirect '/questions/show'
  else
    @errors = new_answer.errors.full_messages
    erb :'/questions/show'
  end
end
