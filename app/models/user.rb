class User < ApplicationRecord
  has_many :favorites
  has_many :games, through: :favorites
  has_many :comments
  has_many :friendships
  has_many :friends, through: :friendships

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable
end
