class FacebookPage
  include Mongoid::Document

  field :facebook_id,     type: Integer
  field :name,            type: String
  field :profile_picture, type: String

  validates :facebook_id, :name, :profile_picture, presence: true

  def self.create_page(facebook_id, name, profile_picture)
    create!(facebook_id:     facebook_id,
            name:            name,
            profile_picture: profile_picture)
  end
end
