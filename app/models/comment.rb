class Comment < ApplicationRecord
  validates :body, presence: true

  belongs_to :commentable, polymorphic: true
  belongs_to :commenter, class_name: :User, foreign_key: :commenter_id #changed from strings to symbols for consistancy
  has_many :votes, as: :votable
end
