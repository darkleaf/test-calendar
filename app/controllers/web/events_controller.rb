class Web::EventsController < Web::ApplicationController
  def new
    @event = current_user.events.build
    authorize @event
  end

  def create
    @event = current_user.events.build
    authorize @event
    if @event.update event_params
      redirect_to calendar_path
    else
      render :new
    end
  end

  def edit
    @event = Event.find params[:id]
    authorize @event
  end

  def update
    @event = Event.find params[:id]
    authorize @event
    if @event.update event_params
      redirect_to calendar_path
    else
      render :edit
    end
  end

  def destroy
    @event = Event.find params[:id]
    authorize @event
    @event.destroy
    redirect_to calendar_path
  end

  private

  def event_params
    params.require(:event).permit(:name, :date, :repeat_period)
  end
end
