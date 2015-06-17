module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title(page_title = '')
    base_title = "Booking"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end
  
  #Append class (for menu) if condition is true (active the item while at that page)
  def menu_class(page_title = '',element = '')
    if page_title.empty? && element==="home"
      "teal active item"
    elsif page_title==="Profile" && element==="profile"
      "green active item"
    elsif page_title==="Users" && element==="user"
      "pink active item"
    elsif page_title==="Book" && element==="book"
      "purple active item"
    elsif page_title==="News" && element==="news"
      "red active item"
    elsif page_title==="Order" && element==="order"
      "blue active item"
    else
        "item"
    end
  end
end

