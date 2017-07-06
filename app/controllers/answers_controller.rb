get '/answers/new' do
  redirect '/' unless logged_in?
  erb :'answers/new'
end

post '/answers' do
  new_answer = Answer.new(body: params[:answer], question_id: params[:question_id])
  new_answer.user = current_user
  if new_answer.save
    @alerts = ["Thanks for your answer!"]
    redirect "/questions/#{params[:question_id]}"
  else
    @errors = new_answer.errors.full_messages
    erb :'/questions/show'
  end
end

get '/answers/:id' do
  @answer = Answer.find(params[:id])
  
  erb :'/answers/show'
end
