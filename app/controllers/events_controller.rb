class EventsController < ApplicationController

  before_action :move_to_index, except: [:index]

  def index
    @event = Event.all
  end

  def new
    @event = Event.new
    render plain: render_to_string(partial: 'form_new', layout: false, locals: { event: @event })
  end
end

private
def move_to_index
  unless user_signed_in?
    redirect_to action: :index
  end
end