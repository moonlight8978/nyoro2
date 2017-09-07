class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  before_create :set_default_role
  has_and_belongs_to_many :roles, join_table: :users_user_roles
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable, :omniauthable
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
  
private

  def set_default_role
    self.roles << Role.find_by_name('user') unless self.roles.size
  end
end
