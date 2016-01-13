class Web::ApplicationController < ApplicationController
  include UserAuthentication

  rescue_from Pundit::NotAuthorizedError, with: :user_not_authorized

  private

  def user_not_authorized
    flash[:alert] = t(:not_authorized)
    redirect_to(request.referrer || root_path)
  end
end
