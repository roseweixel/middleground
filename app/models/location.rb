class Location < ActiveRecord::Base
  has_many :user_locations
  has_many :users, through: :user_locations

  validates_uniqueness_of :street_address, scope: :city
end
