class FinancesController < ApplicationController

  def index
    # 現在のユーザーのレコードを取得
    user_records = Finance.where(user_id: current_user.id)

    # 今日の日付を取得
    today = Date.today

    # 今年の元旦から大晦日までの範囲を取得
    date_range = Date.new(today.year, 1, 1)..Date.new(today.year, 12, 31)

    # 今年の各月の初日の日付を取得し、月ごとの配列に変換
    date_months = date_range.map { |d| Date.new(d.year, d.month, 1) }.uniq

    # 今年の1月から12月までの期間に該当するレコードを取得
    year_date = user_records.where(start_time: date_range)

    # 各項目の合計金額を計算
    food_total = []
    buy_total = []
    amusement_total = []
    traveling_total = []
    other_total = []

    date_months.each do |date|
      end_of_month = date.end_of_month

      food_records = year_date.where(item: "食事代", start_time: date..end_of_month)
      food_total << food_records.sum(:consumption)

      buy_records = year_date.where(item: "購入費", start_time: date..end_of_month)
      buy_total << buy_records.sum(:consumption)

      amusement_records = year_date.where(item: "娯楽費", start_time: date..end_of_month)
      amusement_total << amusement_records.sum(:consumption)

      traveling_records = year_date.where(item: "交通費", start_time: date..end_of_month)
      traveling_total << traveling_records.sum(:consumption)

      other_records = year_date.where(item: "雑費", start_time: date..end_of_month)
      other_total << other_records.sum(:consumption)
    end

    # 各項目の最終値
    @summonth_fooddate = food_total
    @summonth_buydate = buy_total
    @summonth_amusementdate = amusement_total
    @summonth_travelingdate = traveling_total
    @summonth_otherdate = other_total
    
  end

  def show
    # 各項目ごとの合計消費額を取得する
    today_date = Finance.where(user_id: current_user.id, start_time: Date.today.in_time_zone.all_month)
    # 各項目の今月の合計消費額
    @total_food = [today_date.where(item: "食事代").pluck(:consumption).sum]
    @total_buy = [today_date.where(item: "購入費").pluck(:consumption).sum]
    @total_amusement = [today_date.where(item: "娯楽費").pluck(:consumption).sum]
    @total_traveling = [today_date.where(item: "交通費").pluck(:consumption).sum]
    @total_other = [today_date.where(item: "雑費").pluck(:consumption).sum]

    # 今月の各項目の合計金額を配列にして格納
    @total_item = []
    @total_item.push(@total_food, @total_buy, @total_amusement, @total_traveling, @total_other)

    # 今月の全項目の合計金額
    @sum_finances = sum_finances
  end

  private
    # ストロングパラメーター
    def finance_params
      params.require(:finance).permit(:consumption, :item, :event_id, :user_id)
    end
      
    # 月毎の合計金額算出メソッド
    def sum_finances
      finances = Finance.where(user_id: current_user.id)
      # # 今日を取得
      today = Date.today
      # 予定開始日が今月に所属するレコードを取得
      today_date = finances.where(start_time: today.in_time_zone.all_month)
      # 取得したレコードの合計金額取得
      @sum_finance = today_date.pluck(:consumption).sum
    end
    
end
