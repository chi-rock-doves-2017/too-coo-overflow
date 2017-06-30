class Question < ApplicationRecord
  validates :title, presence: true
  validates :body, presence: true

  belongs_to :author, class_name: :User, foreign_key: :author_id #changed from strings to symbols for consistancy
  has_many :answers
  has_many :votes, as: :votable
  has_many :comments, as: :commentable
end
