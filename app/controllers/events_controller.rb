class EventsController < ApplicationController

  before_action :move_to_index, except: [:index, :new, :create]

  def index
    @event = Event.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml { render :xml => @event }
      format.json { render :json => @event }
    end
  end

  def new
    @event = Event.new
  end

  
  def create
    @event = Event.new(event_params)
    if @event.save
      respond_to do |format|
        format.html { redirect_to events_path }
        format.json { redirect_to events_path }
      end
    else
      render :new
    end
    # @event = Event.new(event_params)
    # if @event.save
    #   redirect_to events_path
    # else
    #   redirect_to new_event_path
    # end
  end
    # @events = Event.where(user_id: current_user.id)
end

# def update
#     event = Event.find(params[:id])
#     @events = Event.where(user_id: current_user.id)
#     event.update(event_params)
# end

# def destroy
#     @user = User.find(params[:id])
#     event = Event.find(params[:id])
#     event.destroy
#     redirect_to user_path(@user)
# end

private
def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :body, :user_id, :consumption)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end