module Api
  module V1
    class LocationSerializer < ActiveModel::Serializer
      
      attributes :street_address, :city, :state, :names

      def names
        user_locations = UserLocation.where(location_id: object.id, user_id: current_user.id)
      end

    end
  end
end
