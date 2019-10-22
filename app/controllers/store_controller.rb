class StoreController < ApplicationController
  include ViewsCounter

  def index
    @products = Product.order(:title)
    @views = update_views_count
  end
end
