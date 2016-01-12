module AuthenticationTestHelper
  def current_user
    User.find_by id: session[:user_id]
  end

  def sign_in(user)
    post '/session', session_form: { email: user.email, password: user.password }
  end
end
