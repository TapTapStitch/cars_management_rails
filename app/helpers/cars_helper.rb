# frozen_string_literal: true

module CarsHelper
  include Pagy::Frontend
  def sort_link(sort_order, title)
    link_to title, cars_path(params.merge(sort: sort_order).permit(:sort))
  end
end
