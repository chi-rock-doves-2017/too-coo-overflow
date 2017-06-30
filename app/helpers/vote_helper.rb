helpers do
  def vote_count(votable)
    unless votable.votes.empty?
      p votes_value = votable.votes.map { |vote| vote.value }
      return votes_value.reduce(:+)
    else
      return 0
    end
  end
end
