class WebApi::EventObjectsController < WebApi::ApplicationController
  def index
    skip_policy_scope
    authorize :event_object

    render json: EventObjectsFilterQuery.perform(params[:start], params[:end])
  end
end
