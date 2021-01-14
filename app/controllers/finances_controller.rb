class FinancesController < ApplicationController
  def index
  end

  def show
  end

  def new
    @finance = Finance.new
  end

  def create
    @finance = Finance.new(finance_params)
  end

  private
  
    def finance_params
      params.require(:finance).permit(:consumption, :item)
    end

end
