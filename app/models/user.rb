class User < ActiveRecord::Base
  devise :database_authenticatable, :recoverable, :validatable

  validates :email, presence: true
end
