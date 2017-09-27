class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  after_create_commit :set_default_role
  has_and_belongs_to_many :roles, join_table: :users_user_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  mount_uploader :avatar, AvatarUploader
  
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
  
  def set_default_role
    self.roles << (User::Role.find_by_name('user'))
  end
end
