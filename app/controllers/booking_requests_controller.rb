class BookingToursController < ApplicationController
  def new
    @booking_request = BookingRequest.new
  end

  def create
    @booking_request = Booking_request.new booking_params
    tour = Tour.find_by quantity: params[:booking_request][:tour_id]
    if tour.quantity? params[:booking_request][:quantity]
      if booking_request.save
        flash[:success] = t "flash.bk_success"
        tour.tour_quantity
        redirect_to root_path
      end
    else
      flash[:danger] = t "flash.over_quantity"
      render :new
    end
  end

  def destroy; end

  private

  def booking_params
    params.require(:booking_request).permit(:name, :email, :phone,
      :quantity)
  end
end
