module StaticPagesHelper
  def get_image tourdetail
    return unless tourdetail
    tourdetail.images.first.url
  end

  def get_tour_from_category category
    return unless category
    category.tours.limit Settings.paginate_home
  end
end
