class Customer::ReserveController < ApplicationController
  def index
    @reserves = Reserve.all.where("day >= ?", Date.current).where("day < ?", Date.current >> 3).order(day: :desc)
  end
end
