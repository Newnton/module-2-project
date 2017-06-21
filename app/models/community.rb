class Community < ApplicationRecord
  has_many :posts
  has_many :user_communities
  has_many :users, through: :user_communities

  validates :name, presence: true, uniqueness: true
  validates :description, presence: true, length: {maximum: 250}

  def self.search(search)
    where("name iLIKE ? OR description iLIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def self.community_downcase
    Community.all.map do |community|
      community.name = community.name.downcase
      community.description = community.description.downcase
      community
    end
  end

  def before_save_downcase
    self.name = self.name.downcase
    self.description = self.description.downcase
  end

end
