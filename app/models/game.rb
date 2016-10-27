class Game < ApplicationRecord
  has_many   :favorites
  has_many   :users, through: :favorites
  has_many   :comments
  belongs_to :tag
  has_many   :votes, as: :votable
end
