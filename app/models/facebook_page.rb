class FacebookPage
  include Mongoid::Document

  field :facebook_id,     type: Integer
  field :name,            type: String
  field :profile_picture, type: String

  validates :facebook_id, :name, :profile_picture, presence: true
end
