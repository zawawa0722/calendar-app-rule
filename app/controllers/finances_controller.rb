class FinancesController < ApplicationController

  def index
    @sample = {'2019-06-01' => 60, '2019-06-02' => 65, '2019-06-03' => 64}
    @chart = [['国語', 10],['算数', 20],['理科',30],['社会',40]]
    @data = [['2019-06-01', 100], ['2019-06-02', 200], ['2019-06-03', 150]]
  end

  def show
    # @finance = Finance.find(7)
    # @consumption = @finance.consumption
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
