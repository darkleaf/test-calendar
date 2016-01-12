module UserAuthentication
  extend ActiveSupport::Concern

  included do
    helper_method :current_user
    hide_action :current_user
  end

  class_methods do
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) || Guest.new
  end

  private

  def sign_in(user)
    session[:user_id] = user.id
  end

  def sign_out
    @current_user = nil
    session.delete :user_id
  end
end
