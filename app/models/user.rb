class User < ActiveRecord::Base
  # Include default devise modules.
  devise :database_authenticatable, :registerable, :recoverable, :rememberable, :trackable, :validatable, :omniauthable
  include DeviseTokenAuth::Concerns::User

  validates_presence_of :password_confirmation, on: :create

  has_many :user_locations
  has_many :locations, through: :user_locations
end
