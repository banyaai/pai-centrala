module ApplicationHelper

  #Return a title on per-page basis.
  def title
    base_title = "Ruby on Rails Centrala App"
    if @title.nil?
      base_title
    else
      "#{base_title} | #{@title}"
    end
  end
end
