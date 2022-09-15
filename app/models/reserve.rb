class Reserve < ApplicationRecord
  def self.reservations_after_three_month
      reserves = Reserve.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
      reserves_data = []
      reserves.each do |reserve|
      reserves_hash = {}
      reserves_hash.merge!(day: reserve.day.strftime("%Y-%m-%d"), time: reserve.time)
      reserves_data.push(reserves_hash)
    end
    reserve_data
  end
end