# frozen_string_literal: true

module CarsHelper
  include Pagy::Frontend
  def sort_link(sort_order, title)
    link_to title,
            cars_path(params.merge(sort: sort_order).permit(:make, :model, :price_from, :price_to, :year_from, :year_to,
                                                            :odometer_from, :odometer_to, :sort))
  end
end
