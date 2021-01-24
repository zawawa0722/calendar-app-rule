class FinancesController < ApplicationController

  def index
    # 現在のユーザーのレコードを取得
    @finances = Finance.where(user_id: current_user.id)

    # 2021年の月を配列で取得
    date_from  = Date.parse('2021-01-01')
    date_to    = Date.parse('2021-12-31')
    date_range = date_from..date_to
    @date_months = date_range.map {|d| Date.new(d.year, d.month, 1) }.uniq
    @date_months.map {|d| d.strftime "%m/%Y" }
    @year = @date_months.map {|d| d.in_time_zone.all_month}

    
    # すべての月に該当するレコードを取得
    @year_date = @finances.where(start_time: @year)

    # 各月のitemの合計を取得
    @food = @year_date.where(item: "食事代")
    @buy = @year_date.where(item: "購入費")
    @amusement = @year_date.where(item: "娯楽費")
    @traveling = @year_date.where(item: "交通費")
    @other = @year_date.where(item: "雑費")

    @b1 = @food.order(start_time: :asc)
    @b2 = @buy.order(start_time: :asc)
    @b3 = @amusement.order(start_time: :asc)
    @b4 = @traveling.order(start_time: :asc)
    @b5 = @other.order(start_time: :asc)

    # 食費
    if @c = @b1.where(start_time: @year[0])
      @food_total = [@c.pluck(:consumption).sum]
      @d = @b1.where(start_time: @year[1])
      @food_total.push(@d.pluck(:consumption).sum)

      @e = @b1.where(start_time: @year[2])
      @food_total.push(@e.pluck(:consumption).sum)

      @f = @b1.where(start_time: @year[3])
      @food_total.push(@f.pluck(:consumption).sum)

      @g = @b1.where(start_time: @year[4])
      @food_total.push(@g.pluck(:consumption).sum)

      @h = @b1.where(start_time: @year[5])
      @food_total.push(@h.pluck(:consumption).sum)

      @i = @b1.where(start_time: @year[6])
      @food_total.push(@i.pluck(:consumption).sum)

      @j = @b1.where(start_time: @year[7])
      @food_total.push(@j.pluck(:consumption).sum)

      @k = @b1.where(start_time: @year[8])
      @food_total.push(@k.pluck(:consumption).sum)

      @l = @b1.where(start_time: @year[9])
      @food_total.push(@l.pluck(:consumption).sum)

      @m = @b1.where(start_time: @year[10])
      @food_total.push(@m.pluck(:consumption).sum)

      @n = @b1.where(start_time: @year[11])
      @food_total.push(@n.pluck(:consumption).sum)

      @o = @b1.where(start_time: @year[12])
      @food_total.push(@o.pluck(:consumption).sum)
    end

    # 購入費
    if @c = @b2.where(start_time: @year[0])
      @buy_total = [@c.pluck(:consumption).sum]
      @d = @b2.where(start_time: @year[1])
      @buy_total.push(@d.pluck(:consumption).sum)

      @e = @b2.where(start_time: @year[2])
      @buy_total.push(@e.pluck(:consumption).sum)

      @f = @b2.where(start_time: @year[3])
      @buy_total.push(@f.pluck(:consumption).sum)

      @g = @b2.where(start_time: @year[4])
      @buy_total.push(@g.pluck(:consumption).sum)

      @h = @b2.where(start_time: @year[5])
      @buy_total.push(@h.pluck(:consumption).sum)

      @i = @b2.where(start_time: @year[6])
      @buy_total.push(@i.pluck(:consumption).sum)

      @j = @b2.where(start_time: @year[7])
      @buy_total.push(@j.pluck(:consumption).sum)

      @k = @b2.where(start_time: @year[8])
      @buy_total.push(@k.pluck(:consumption).sum)

      @l = @b2.where(start_time: @year[9])
      @buy_total.push(@l.pluck(:consumption).sum)

      @m = @b2.where(start_time: @year[10])
      @buy_total.push(@m.pluck(:consumption).sum)

      @n = @b2.where(start_time: @year[11])
      @buy_total.push(@n.pluck(:consumption).sum)

      @o = @b2.where(start_time: @year[12])
      @buy_total.push(@o.pluck(:consumption).sum)
    end

    # 娯楽費
    if @c = @b3.where(start_time: @year[0])
      @amusement_total = [@c.pluck(:consumption).sum]
      @d = @b3.where(start_time: @year[1])
      @amusement_total.push(@d.pluck(:consumption).sum)

      @e = @b3.where(start_time: @year[2])
      @amusement_total.push(@e.pluck(:consumption).sum)

      @f = @b3.where(start_time: @year[3])
      @amusement_total.push(@f.pluck(:consumption).sum)

      @g = @b3.where(start_time: @year[4])
      @amusement_total.push(@g.pluck(:consumption).sum)

      @h = @b3.where(start_time: @year[5])
      @amusement_total.push(@h.pluck(:consumption).sum)

      @i = @b3.where(start_time: @year[6])
      @amusement_total.push(@i.pluck(:consumption).sum)

      @j = @b3.where(start_time: @year[7])
      @amusement_total.push(@j.pluck(:consumption).sum)

      @k = @b3.where(start_time: @year[8])
      @amusement_total.push(@k.pluck(:consumption).sum)

      @l = @b3.where(start_time: @year[9])
      @amusement_total.push(@l.pluck(:consumption).sum)

      @m = @b3.where(start_time: @year[10])
      @amusement_total.push(@m.pluck(:consumption).sum)

      @n = @b3.where(start_time: @year[11])
      @amusement_total.push(@n.pluck(:consumption).sum)

      @o = @b3.where(start_time: @year[12])
      @amusement_total.push(@o.pluck(:consumption).sum)
    end

    # 交通費
    if @c = @b4.where(start_time: @year[0])
      @traveling_total = [@c.pluck(:consumption).sum]
      @d = @b4.where(start_time: @year[1])
      @traveling_total.push(@d.pluck(:consumption).sum)

      @e = @b4.where(start_time: @year[2])
      @traveling_total.push(@e.pluck(:consumption).sum)

      @f = @b4.where(start_time: @year[3])
      @traveling_total.push(@f.pluck(:consumption).sum)

      @g = @b4.where(start_time: @year[4])
      @traveling_total.push(@g.pluck(:consumption).sum)

      @h = @b4.where(start_time: @year[5])
      @traveling_total.push(@h.pluck(:consumption).sum)

      @i = @b4.where(start_time: @year[6])
      @traveling_total.push(@i.pluck(:consumption).sum)

      @j = @b4.where(start_time: @year[7])
      @traveling_total.push(@j.pluck(:consumption).sum)

      @k = @b4.where(start_time: @year[8])
      @traveling_total.push(@k.pluck(:consumption).sum)

      @l = @b4.where(start_time: @year[9])
      @traveling_total.push(@l.pluck(:consumption).sum)

      @m = @b4.where(start_time: @year[10])
      @traveling_total.push(@m.pluck(:consumption).sum)

      @n = @b4.where(start_time: @year[11])
      @traveling_total.push(@n.pluck(:consumption).sum)

      @o = @b4.where(start_time: @year[12])
      @traveling_total.push(@o.pluck(:consumption).sum)
    end
    # 雑費
    if @c = @b5.where(start_time: @year[0])
      @other_total = [@c.pluck(:consumption).sum]
      @d = @b5.where(start_time: @year[1])
      @other_total.push(@d.pluck(:consumption).sum)

      @e = @b5.where(start_time: @year[2])
      @other_total.push(@e.pluck(:consumption).sum)

      @f = @b5.where(start_time: @year[3])
      @other_total.push(@f.pluck(:consumption).sum)

      @g = @b5.where(start_time: @year[4])
      @other_total.push(@g.pluck(:consumption).sum)

      @h = @b5.where(start_time: @year[5])
      @other_total.push(@h.pluck(:consumption).sum)

      @i = @b5.where(start_time: @year[6])
      @other_total.push(@i.pluck(:consumption).sum)

      @j = @b5.where(start_time: @year[7])
      @other_total.push(@j.pluck(:consumption).sum)

      @k = @b5.where(start_time: @year[8])
      @other_total.push(@k.pluck(:consumption).sum)

      @l = @b5.where(start_time: @year[9])
      @other_total.push(@l.pluck(:consumption).sum)

      @m = @b5.where(start_time: @year[10])
      @other_total.push(@m.pluck(:consumption).sum)

      @n = @b5.where(start_time: @year[11])
      @other_total.push(@n.pluck(:consumption).sum)

      @o = @b5.where(start_time: @year[12])
      @other_total.push(@o.pluck(:consumption).sum)
    end




    # 各項目最終値［配列］
    @summonth_fooddate = @food_total
    @summonth_buydate = @buy_total
    @summonth_amusementdate = @amusement_total
    @summonth_travelingdate = @traveling_total
    @summonth_otherdate = @other_total

    # 合計金額
    @sum_finances = sum_finances


  end


  def show

    # 現在のユーザーのレコードを取得
    @finances = Finance.where(user_id: current_user.id)
    # 今日を取得
    @today = Date.today
    # 予定開始日が今月に所属するレコードを取得
    @today_date = @finances.where(start_time: @today.in_time_zone.all_month)

    # 各項目の今月の合計消費額
    @total_food = [@today_date.where(item: "食事代").pluck(:consumption).sum]
    @total_buy = [@today_date.where(item: "購入費").pluck(:consumption).sum]
    @total_amusement = [@today_date.where(item: "娯楽費").pluck(:consumption).sum]
    @total_traveling = [@today_date.where(item: "交通費").pluck(:consumption).sum]
    @total_other = [@today_date.where(item: "雑費").pluck(:consumption).sum]

    # 配列化
    @total_item = []
    @total_item.push(@total_food, @total_buy, @total_amusement, @total_traveling, @total_other)

    @sum_finances = sum_finances
  end

  private
    # ストロングパラメーター
    def finance_params
      params.require(:finance).permit(:consumption, :item, :event_id, :user_id)
    end
      

      

    # 月毎の合計金額算出メソッド
    def sum_finances
      @finances = Finance.where(user_id: current_user.id)
      # 今日を取得
      @today = Date.today
      # 予定開始日が今月に所属するレコードを取得
      @today_date = @finances.where(start_time: @today.in_time_zone.all_month)
      # 取得したレコードの合計金額取得
      @sum_finance = @today_date.pluck(:consumption).sum
    end

    def sum_finances_food
      @food_date = [@finances.where(item: "食事代").pluck(:consumption).sum]
    end

    def sum_finances_buy
      @b1uy_date = [@finances.where(item: "購入費").pluck(:consumption).sum]
    end

    def sum_finances_amusement
      @amusement_date = [@finances.where(item: "娯楽費").pluck(:consumption).sum]
    end

    def sum_finances_traveling
      @traveling_date = [@finances.where(item: "交通費").pluck(:consumption).sum]
    end

    def sum_finances_other
      @other_date = [@finances.where(item: "雑費").pluck(:consumption).sum]
    end
    
    

end
