helpers do
  def vote_count(votable)
    unless votable.votes.empty?
      return votable.votes.reduce(:+)
    else
      return 0
    end
  end
end