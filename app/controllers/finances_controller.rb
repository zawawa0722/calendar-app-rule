class FinancesController < ApplicationController

  def index
    @finances = Finance.where(user_id: current_user.id)
  end

  def show
    @finances = Finance.where(user_id: current_user.id)
  end

  def new
    @finance = Finance.new
  end

  def create
    @finance = Finance.new(finance_params)
  end

  private
  
    def finance_params
      params.require(:finance).permit(:consumption, :item, :event_id, :user_id)
    end

end
