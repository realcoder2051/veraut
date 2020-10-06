module ApplicationHelper

  include Pagy::Frontend

  def pretty_boolean(bool)
    if [true, 'true', 'yes', 'success'].include?(bool)
      "<span class='badge badge-success'>#{bool}</span>"
    else
      "<span class='badge badge-danger'>#{bool}</span>"
    end.html_safe
  end

  def flash_class(level)
    case level.to_sym
      when :notice then 'alert alert-info'
      when :success then 'alert alert-success'
      when :error then 'alert alert-danger'
      when :alert then 'alert alert-warning'
    end
  end

end
