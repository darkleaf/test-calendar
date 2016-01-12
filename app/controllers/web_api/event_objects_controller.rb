class WebApi::EventObjectsController < WebApi::ApplicationController
  def index
    skip_policy_scope
    authorize :event_object

    render json: [
        {title: '123', start: 1.day.ago}
    ]
  end
end
