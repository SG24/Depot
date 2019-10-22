module ViewsCounter
  private

  # Initializes or increments the view counter
  def update_views_count
    views = session[:counter]
    if views.nil?
      views = 1
    else
      views += 1
    end
    session[:counter] = views
    views
  end

  def reset_views_count
    session[:counter] = 0
  end
end
