class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable,
          :recoverable, :rememberable, :trackable, :validatable

  include DeviseTokenAuth::Concerns::User

  before_validation :assign_uid_and_provider
  
  has_many :memberships
  has_many :groups, through: :memberships

  private
    def assign_uid_and_provider
      self.uid = self.email
      self.provider = 'email'
    end
end
