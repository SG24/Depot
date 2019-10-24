class StoreController < ApplicationController
  include ViewsCounter
  include CurrentCart

  skip_before_action :authorize
  before_action :set_cart

  def index
    @products = Product.order(:title)
    @views = update_views_count
  end
end
