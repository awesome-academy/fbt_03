class ToursController < ApplicationController
  def index
    @all_tours = Tour.paginate page: params[:page],
     per_page: Settings.paginate_view_detail
  end

  def show
    @tour = Tour.find_by id: params[:id]
    if @tour
      @tour_detail = @tour.tour_detail
    else
      flash[:danger] = t ".tour_not_found"
      redirect_to root_path
    end
  end
end
