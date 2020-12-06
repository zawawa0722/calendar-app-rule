class EventsController < ApplicationController

  before_action :move_to_index, except: [:index]

  def index
    @event = Event.all
  end
end

private
def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end