post '/votes' do
  vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
  vote.votable_id = params[:votable_id]
  vote.votable_type = params[:votable_type]
  if vote.save
    redirect back
  else
    @errors = ["Your doot didn't poot, sorry!"]
    erb :index
  end
end
