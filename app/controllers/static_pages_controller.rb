class StaticPagesController < ApplicationController
  def home
    @categories = Category.order_create.paginate page: params[:page],
     per_page: Settings.paginate_home
  end

  def about; end

  def contact; end
end
