post '/votes' do
	if logged_in?
		p "#{@question}"
	  vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
	  vote.votable_id = params[:votable_id]
	  vote.votable_type = params[:votable_type]
	  p "==============================="
	  p params
	  p "==============================="
	  if vote.save
	    if request.xhr?
	      content_type:json
	      {vote_count: vote}.to_json
	      # erb :"_votes", layout: false, locals: {votable: params[:votable], votable_type: vote.votable_type, votable_id: vote.votable_id }
	    end
	  #Matt redirect fix on 7/6/17, not proud but it works
	  #Saham I changed to question_di to id. It was not working previously
	    if vote.votable_type != "Question"
	    	redirect "/questions/#{vote.votable.id}"
	    else
	    	redirect "/questions/#{vote.votable.id}"
	    end
	  #end of Matt fix
	  else
	    @errors = ["Your doot didn't poot, sorry!"]
	    erb :index
	  end

	else
		@errors = ["You are not logged in to vote!"]
	  erb :'sessions/new'
	end

end

