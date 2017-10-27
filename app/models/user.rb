class User < ApplicationRecord
  include MemberOfCountry
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  # settings and associations
  after_create_commit :set_default_role
  has_and_belongs_to_many :roles,
    join_table: :users_user_roles, after_add: :reindex, after_remove: :reindex
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable
  devise :omniauthable, :omniauth_providers => [:facebook, :google_oauth2, :twitter]
  mount_uploader :avatar, AvatarUploader
  has_many :ratings,
    class_name: 'Feature::Rating'
  has_many :rated_albums,
    through: :ratings, source_type: 'Db::Album', source: :rateable
  has_many :comments,
    class_name: 'Feature::Comment'
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

  searchable do
    text :user_name, boost: 2
    text :email, boost: 2
    string :role do
      if is_admin?
        'admin'
      elsif is_moderator?
        'moderator'
      elsif is_user?
        'user'
      else
        'banned'
      end
    end
    string :social_provider do
      provider.present? ? provider.split('_').first : ''
    end
    string :activation do
      confirmed_at && (confirmed_at > confirmation_sent_at) ? 'activated' : 'not_activated'
    end
  end

  # validates

  # callbacks
  def set_default_role
    self.roles << (User::Role.find_by_name('user'))
  end

  def reindex(role)
    Sunspot.index self
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
