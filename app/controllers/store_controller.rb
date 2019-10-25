class StoreController < ApplicationController
  include ViewsCounter
  include CurrentCart

  skip_before_action :authorize
  before_action :set_cart

  def index
    if params[:set_locale]
      redirect_to store_index_url(locale: params[:set_locale])
    else
      @products = Product.order(:title)
      @views = update_views_count
    end
  end
end
