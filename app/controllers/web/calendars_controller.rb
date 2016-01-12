class Web::CalendarsController < Web::ApplicationController
  def show
    authorize :calendar
  end
end
