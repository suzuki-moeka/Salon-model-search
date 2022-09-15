module Customer::ReserveHelper
  
  def times
     times = ["9:00",
              "9:30",
              "10:00",
              "10:30",
              "11:00",
              "11:30",
              "13:00",
              "13:30",
              "14:00",
              "15:00",
              "15:30",
              "16:00",
              "16:30"]
  end
  
  def check_reserve(reserve, day, time)
    result = false
    reserves_count = reserves.count
    # 取得した予約データにdayとtimeが一致する場合はtrue,一致しない場合はfalseを返します
    if reserves_count > 1
      reserves.each do |reserve|
        result = reserve[:day].eql?(day.strftime("%Y-%m-%d")) && reserve[:time].eql?(time)
        return result if result
      end
    elsif reserves_count == 1
      result = reserves[0][:day].eql?(day.strftime("%Y-%m-%d")) && reserves[0][:time].eql?(time)
      return result if result
    end
    return result
  end
end