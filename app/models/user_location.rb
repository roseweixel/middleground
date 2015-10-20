class UserLocation < ActiveRecord::Base
  belongs_to :user
  belongs_to :location

  validates :user, :location, presence: true
  validates_uniqueness_of :location, scope: [:user, :name]
end
