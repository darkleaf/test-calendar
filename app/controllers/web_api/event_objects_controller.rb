class WebApi::EventObjectsController < WebApi::ApplicationController
  def index
    skip_policy_scope
    authorize :event_object

    event_objects = EventObjectsFilterQuery.perform(params[:start], params[:end])

    render json: event_objects
  end
end
