post '/votes' do
  vote = Vote.new(value: params[:vote], voter_id: current_user.id)
  vote.votable = params[:voteable]
  vote.save
  redirect back
end