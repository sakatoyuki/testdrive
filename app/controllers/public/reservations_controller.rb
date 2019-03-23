class Public::ReservationsController < ApplicationController
  def new
    require "date"
    @d = Date.today
    @cars = Car.all


  end

  def top
  end

  def confirm
  end
end
