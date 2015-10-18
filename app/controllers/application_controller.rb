class ApplicationController < ActionController::API
  before_filter :authenticate_from_token

  respond_to :json

  protected

    def authenticate_from_token
      if current_token.try(:authenticable)
        sign_in(current_token.authenticable, store: false)
      end
    end

    def current_token
      AuthenticationToken.find_authenticated({
        secret: (params[:secret] || request.headers[:secret]),
        secret_id: (params[:secret_id] || request.headers[:secret_id])
      })
    end
end
