require 'test_helper'

class StoreControllerTest < ActionDispatch::IntegrationTest
  test 'should get index' do
    get store_index_url
    assert_response :success
    assert_select '#columns #side a', minimum: 4
    assert_select '#main .entry', 3
    assert_select 'h3', 'Programming Ruby 1.9'
    assert_select '.price', /\$[,\d]+\.\d\d/
  end

  test 'should display views if greater than 4 and reset to 0 if new items are added to cart' do
    get store_index_url
    assert_select 'p#counter', text: '', count: 1
    assert_equal 1, session[:counter]
    5.times do
      get store_index_url
    end
    assert_equal 6, session[:counter]
    assert_select 'p#counter', text: '6 views', count: 1
    # Adds a new line item to cart
    post line_items_url(product_id: products(:one).id)
    # Redirects to home page
    get store_index_url
    assert_equal 1, session[:counter]
    assert_select 'p#counter', text: '', count: 1
  end
end
