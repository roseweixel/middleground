module Api
  module V1
    class UserSerializer < ActiveModel::Serializer
      
      attributes :email, :user_id, :locations

      def user_id
        object.id
      end

      def token_type
        'Bearer'
      end

    end
  end
end
