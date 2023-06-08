class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
         
  Roles = [ :admin , :default ]
  before_create :set_default_role

  def set_default_role
    self.role ||= :user
  end
  def is?( requested_role )
    self.role == requested_role.to_s
  end
end
