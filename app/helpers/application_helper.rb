module ApplicationHelper
  def offerable_link(offer)
    offerable_paths = {
      "Vehicle" => :vehicle_path,
      "Property" => :property_path,
      "Service" => :service_path
    }

    if offerable_paths.key?(offer.offerable_type)
      link_to send(offerable_paths[offer.offerable_type], offer.offerable) do
        render "shared/offer", offer: offer
      end
    end
  end

  def category_list(title, items, ul_class, li_class, button_class)
    content_tag(:ul, class: ul_class, id: title) do
      concat content_tag(:button, title, class: button_class)
      items.each do |item|
        concat content_tag(:li, item, class: li_class)
      end
    end
  end

  def time_ago(timestamp)
    time_difference = (Time.current - timestamp).to_i

    if time_difference <= 0
      "just now"
    elsif time_difference < 60
      "#{time_difference} second#{'s' if time_difference > 1} ago"
    elsif time_difference < 3600
      minutes = time_difference / 60
      "#{minutes} minute#{'s' if minutes > 1} ago"
    elsif time_difference < 86400
      hours = time_difference / 3600
      "#{hours} hour#{'s' if hours > 1} ago"
    else
      days = time_difference / 86400
      "#{days} day#{'s' if days > 1} ago"
    end
  end
end
