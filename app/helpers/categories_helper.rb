module CategoriesHelper
  def category_tree_for(category)
    category.map do |category, nested_categories|
      render(category) +
        (nested_categories.size > 0 ? content_tag(:div, category_tree_for(nested_categories), class: "replies") : nil)
    end.join.html_safe
  end

  def show_categories_to_sidebar(category)
    category.map do |category, nested_categories|
      render(category, from_reply_form: true, category_has_many_posts: true) +
        (nested_categories.size > 0 ? content_tag(:div, show_categories_to_sidebar(nested_categories), class: "replies") : nil)
    end.join.html_safe
  end
end
