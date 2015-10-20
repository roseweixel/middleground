module Api
  module V1
    class SessionSerializer < ActiveModel::Serializer
      
      attributes :email, :token_type, :user_id, :token

      def user_id
        object.id
      end

      def token_type
        'Bearer'
      end

      def token
        options[:token]
      end

    end
  end
end
