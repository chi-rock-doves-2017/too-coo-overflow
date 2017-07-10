post '/votes' do
	if logged_in?

		# Only allows user to upvote or downvote once, but they can change their vote
		votes = Vote.all
		vote = votes.find_by(voter_id: current_user.id, votable_id: params[:votable_id])
		if vote == nil
			vote = Vote.new(value: params[:vote].to_i, voter_id: current_user.id)
	  		vote.votable_id = params[:votable_id]
	  		vote.votable_type = params[:votable_type]
	  	else
	  		vote.value = params[:vote].to_i
	  	end

		if vote.save
			if request.xhr?
				content_type:json
				{vote_count: vote}.to_json
			end

		    if vote.votable_type == "Question"
		    	redirect "/questions/#{vote.votable.id}"
		    elsif vote.votable_type == "Answer"
		    	redirect "/questions/#{vote.votable.question_id}"
		    elsif vote.votable_type == "Comment"
		    	if vote.votable.commentable_type == "Answer"
		    		redirect "/questions/#{vote.votable.commentable.question_id}"
		    	elsif vote.votable.commentable_type == "Question"
		    		redirect "/questions/#{vote.votable.commentable.id}"
		    	end
		    end

		else
			@errors = ["Your doot didn't poot, sorry!"]
			erb :index
		end

	else
		@errors = ["You are not logged in to vote!"]
	  erb :'sessions/new'
	end

end

