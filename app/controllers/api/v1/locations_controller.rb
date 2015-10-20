module Api
  module V1
    class LocationsController < ApplicationController

      def create
        @location = Location.new(location_params)

        if @location.save
          create_user_location
          render json: @location, serializer: V1::LocationSerializer, root: nil
        else
          render json: { error: (@location.errors.full_messages.to_sentence) }, status: :unprocessable_entity
        end
      end

      private
        def create_user_location
          UserLocation.create(user_id: current_user.id, location_id: @location.id)
        end

        def location_params
          params.require(:location).permit(:street_address, :city, :state)
        end
    end
  end
end
