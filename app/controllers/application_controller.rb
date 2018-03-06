class ApplicationController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods
  # Require authentication for all controllers
  before_action :require_login

  # Authenticate user
  def require_login
    authorize_request || render_unauthorized("Access denied")
  end

  # Get the current user in a request
  def current_user
    @current_user ||= authorize_request
  end

  # Render a message when user is unauthorized
  def render_unauthorized(message)
    errors = { errors: [ { detail: message } ] }
    render json: errors, status: :unauthorized
  end

  private
  # Authenticate user by token
  def authorize_request
    authenticate_with_http_token do |token, options|
      User.find_by(token: token)
    end
  end
end
