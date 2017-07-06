get '/questions/new' do
  redirect '/' unless logged_in?
  erb :'questions/new'
end

post '/questions' do
  new_question = Question.new(params[:question])
  new_question.author = current_user
  if new_question.save
    @alerts = ["Thanks for asking!"]
    redirect '/'
  else
    @errors = new_question.errors.full_messages
    erb :'questions/new'
  end
end

get '/questions/:id' do
  @question = Question.find(params[:id])
  
  erb :'questions/show'
end
