module ApplicationHelper
  def show_estimated_time(model)
    if model.estimated_time > 60
      "#{model.estimated_time/60} min"
    else
      "#{model.estimated_time} sec"
    end
  end
end


