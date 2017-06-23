class Post < ApplicationRecord
  belongs_to :user
  belongs_to :community
  has_many :comments

  validates :title, presence: true
  validates :content, presence: true

  has_attached_file :photo, styles: {
    thumb: '100x100>',
    square: '200x200#',
    medium: '300x300>'
  }
  validates_attachment_content_type :photo, :content_type => /\Aimage\/.*\Z/
  
  def self.search(search)
    where("title iLIKE ? OR content iLIKE ?", "%#{search.downcase}%", "%#{search.downcase}%")
  end

  def api_date_format
    date = self.created_at.strftime("%m/%y")
    url = "http://history.muffinlabs.com/date/#{date}"
    date_data = JSON.parse(RestClient.get(url))
    doc = date_data["data"]["Events"][0].values
    doc
  end

end
