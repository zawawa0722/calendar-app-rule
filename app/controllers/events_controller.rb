class EventsController < ApplicationController

  before_action :move_to_index, except: [:index, :new, :create]
  before_action :set_event, only: [:edit, :destroy, :show, :update]

  def index
    @events = Event.where(user_id: current_user.id)
  end

  def show
    @events = Event.where(user_id: current_user.id)
    @finance = Finance.where(event_id: @event.id)
    @i = @finance.pluck("item")
    @item = @i[0]
    @c = @finance.pluck("consumption")
    @consumption = @c[0]
  end

  def new
    @event = Event.new
    @event.build_finance
  end

  
  def create
    @event = Event.new(event_params)
    @event.build_finance(event_params[:finance_attributes])

    respond_to do |format|
      if @event.save
        format.html { redirect_to action: :index, notice: '予定を作成しました' }
        format.json { render :show, status: :created, location: @event  }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    @finance = Finance.last(params[:id])
    @finance.update(user_id: current_user.id)
    @finance.update(start_time: @event.start_time)
    @event.update(finance_id: @event.id)
  end

  def edit
  end

  def update
    @finance = Finance.where(event_id: @event.id)
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: '予定を変更しました' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end

    @finance.update(user_id: current_user.id)
    @finance.update(start_time: @event.start_time)
  end

  def destroy
    if @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: '予定を削除しました' }
      format.json { head :no_content }
    end
    else
      redirect_to action: :show
    end
  end

  private
    def event_params
      params.require(:event).permit(
        :title, 
        :start_time, 
        :end_time, 
        :body,
        :user_id,
        :all_time,
        finance_attributes: [:id, :consumption, :item, :user_id, :start_time]
      ).merge(
        user_id: current_user.id
      )  
    end
    

    def set_event
      @event = Event.find(params[:id])
    end

    def move_to_index
      unless user_signed_in?
        redirect_to action: :index
      end
    end
end