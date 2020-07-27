module ApplicationHelper
  # Don't manipulate timezone this way.
  # Manipulate timezone in app/controllers/application_controller.rb
  def date_in_time_zone(t)
    t.in_time_zone Config.current_time_zone
  end
end
