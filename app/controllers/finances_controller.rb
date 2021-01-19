class FinancesController < ApplicationController

  def index
    @finances = Finance.where(user_id: current_user.id)

    @food_date = @finances.where(item: "食事代").pluck(:consumption)
    @food = @finances.where(item: "食事代").pluck(:item).uniq

    @buy_date = @finances.where(item: "購入費").pluck(:consumption)
    @buy = @finances.where(item: "家賃").pluck(:item).uniq

    @amusement_date = @finances.where(item: "娯楽費").pluck(:consumption)
    @amusement = @finances.where(item: "娯楽費").pluck(:item).uniq

    @traveling_date = @finances.where(item: "交通費").pluck(:consumption)
    @traveling = @finances.where(item: "交通費").pluck(:item).uniq

    @other_date = @finances.where(item: "雑費").pluck(:consumption)
    @other = @finances.where(item: "雑費").pluck(:item).uniq
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
