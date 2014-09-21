class User
  include Mongoid::Document
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
    :recoverable, :rememberable, :trackable, :validatable,
    :omniauthable, omniauth_providers: [:facebook]

  ## Custom fields
  field :name,  type: String
  field :image, type: String

  ## Database authenticatable
  field :email,              type: String, default: ""
  field :encrypted_password, type: String, default: ""

  ## Recoverable
  field :reset_password_token,   type: String
  field :reset_password_sent_at, type: Time

  ## Rememberable
  field :remember_created_at, type: Time

  ## Trackable
  field :sign_in_count,      type: Integer, default: 0
  field :current_sign_in_at, type: Time
  field :last_sign_in_at,    type: Time
  field :current_sign_in_ip, type: String
  field :last_sign_in_ip,    type: String

  ## Omniauthable
  field :provider,             type: String
  field :uid,                  type: String
  field :access_token,         type: String
  field :access_token_expires, type: Integer

  has_many :facebook_pages

  def self.from_omniauth(auth)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email                = auth.info.email
      user.password             = Devise.friendly_token[0,20]
      user.name                 = auth.info.name
      user.image                = auth.info.image
      user.access_token         = auth.credentials.token
      user.access_token_expires = auth.credentials.expires_at
    end
  end

  def token_not_expired?
    access_token_expires > Time.now.to_i
  end

  def renew_token
    oauth_hash = Facebook::TokenRenewer.(access_token)
    self.access_token         = oauth_hash['access_token']
    self.access_token_expires = oauth_hash['expires']
    save!
  end
end
