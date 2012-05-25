module HomeHelper
  def category_item name
    content_tag :div, :class => "item" do
      (
        image_tag('categories/' + friendly_filename(name) + ".gif", :alt => nil) +
        content_tag(:p, name)
      )
    end          
  end
  
private
  def friendly_filename(filename)
      filename.gsub(/[^\w\s_-]+/, '')
              .gsub(/(^|\b\s)\s+($|\s?\b)/, '\\1\\2')
              .gsub(/\s+/, '_')
              .downcase
  end
end
