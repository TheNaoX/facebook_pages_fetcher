class FacebookPage
  include Mongoid::Document
  include Mongoid::Timestamps

  field :facebook_id,     type: String
  field :name,            type: String
  field :profile_picture, type: String
  field :about,           type: String

  belongs_to :user

  validates :facebook_id, :name, :profile_picture, :user, presence: true
  validates :facebook_id, uniqueness: true

  def self.create_page(facebook_id, name, profile_picture, user_id, about=nil)
    create!(facebook_id:     facebook_id,
            name:            name,
            profile_picture: profile_picture,
            user_id:         user_id,
            about:           about)
  end
end
