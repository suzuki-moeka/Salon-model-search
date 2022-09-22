class Reserve < ApplicationRecord
  belongs_to :customer
  belongs_to :admin, optional: true

  def self.reserves_after_three_month
      reserves = Reserve.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
      reserves_data = []
      reserves.each do |reserve|
      reserves_hash = {}
      reserves_hash.merge!(day: reserve.day.strftime("%Y-%m-%d"), time: reserve.time)
      reserves_data.push(reserves_hash)
    end
    reserves_data
  end

  def self.check_reserve_day(day)
    if day < Date.current
      return "※過去の日付は選択できません。正しい日付を選択してください。"
    elsif day < (Date.current + 1)
      return "※当日は選択できません。正しい日付を選択してください。"
    elsif (Date.current >> 3) < day
      return "※3ヶ月以降の日付は選択できません。正しい日付を選択してください。"
    end
  end
end