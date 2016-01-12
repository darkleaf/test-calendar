class Web::WelcomeController < Web::ApplicationController
  def show
    authorize :welcome
  end
end
