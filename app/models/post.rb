class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  def self.search(search)
    where("title iLIKE ? OR content iLIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end
end
