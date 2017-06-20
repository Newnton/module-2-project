class Community < ApplicationRecord
  has_many :posts
  has_many :user_communities
  has_many :users, through: :user_communities

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: {maximum: 250}
  
end
