class EventsController < ApplicationController

  before_action :move_to_index, except: [:index, :new, :create]

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
    # render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end

  def create
      @event = Event.new(event_params)
      if @event.save
        flash.now[:success] = "予定を登録しました"
      else
        flash.now[:danger] = "予定の登録に失敗しました"
      end
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
    params.require(:event).permit(:title, :starttime, :endtime, :memo)
end

def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end