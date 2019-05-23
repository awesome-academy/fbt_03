class BookingToursController < ApplicationController
  before_action :logged_in_user, only: %i(new create destroy)

  def new; end

  def create
    tour = Tour.find_by
    @booking_request = current_user.tours << current_tour.build booking_request_params
    if current_tour.quantity? params[:booking_request][:quantity]
      if @booking_request.save
        flash[:success] = t "flash.bk_success"
        current_tour.tour_quantity
        redirect_to root_path
      end
    else
      flash[:danger] = t "flash.over_quantity"
      render :new
    end
  end

  def destroy; end

  private

  def booking_request_params
    params.require(:booking_request).permit(:name, :email, :phone,
      :quantity)
  end
end
