class User < ApplicationRecord
  include MemberOfCountry
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # settings and associations
  after_create_commit :set_default_role
  has_and_belongs_to_many :roles, join_table: :users_user_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  mount_uploader :avatar, AvatarUploader
  has_many :ratings, 
    foreign_key: :user_id, class_name: 'Feature::Rating'
  has_many :rated_albums, 
    through: :ratings, source_type: 'Db::Album', source: :rateable
  #scopes
  
  # class methods
  def self.from_omniauth(auth)
    # find_by(provider: auth.provider, uid: auth.uid)
    where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
      user.email = auth.info.email
      user.password = Devise.friendly_token[0, 20]
      # If you are using confirmable and the provider(s) you use validate emails, 
      # uncomment the line below to skip the confirmation emails.
      # user.skip_confirmation!
    end
  end
  
  # validates
  
  # callbacks
  def set_default_role
    self.roles << (User::Role.find_by_name('user'))
  end
  
  # instance methods
  def is_admin?
    self.roles.pluck(:name).include?('admin')
  end
  
  def is_moderator?
    self.roles.pluck(:name).include?('moderator')
  end
  
  def is_user?
    self.roles.pluck(:name).include?('user')
  end
  
  def is_banned?
    self.roles.pluck(:name).include?('banned')
  end
  
  def is_current_user?(current_user)
    current_user && current_user.id == self.id
  end
end
