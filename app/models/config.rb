class Config < ApplicationRecord

  # https://guides.rubyonrails.org/active_record_querying.html#scopes
  # The following are the same result

  # Scope
  # scope :current_time_zone, -> { where(name: "time_zone").first.value }

  # Method , preffered, especially when passing argv into scope
  def self.current_time_zone
    where(name: "time_zone").first.value
  end
end
