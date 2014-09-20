class FacebookPage
  include Mongoid::Document

  field :facebook_id, type: Integer

  validates :facebook_id, presence: true
end
