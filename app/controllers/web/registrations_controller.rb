class Web::RegistrationsController < Web::ApplicationController
  def new
    authorize :registration
    @registration_user_type = RegistrationUserType.new
  end

  def create
    authorize :registration
    @registration_user_type = RegistrationUserType.create user_params

    if @registration_user_type.persisted?
      sign_in @registration_user_type
      redirect_to root_path
    else
      render :new
    end
  end

  private

  def user_params
    params.require(:user).permit(:full_name, :email, :password, :password_confirmation)
  end
end
