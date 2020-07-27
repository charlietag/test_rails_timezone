class ApplicationController < ActionController::Base

  # Best practice
  # Ref. https://api.rubyonrails.org/classes/Time.html#method-c-use_zone
  # Ref. https://prathamesh.tech/2019/07/11/use-time-use_zone-to-navigate-timezone
  # Ref. https://thoughtbot.com/blog/its-about-time-zones#with-user-time-zones
  around_action :set_time_zone

  def set_time_zone
    if Config.current_time_zone
      Time.use_zone(Config.current_time_zone) { yield }
    else
      yield
    end
  end
end
