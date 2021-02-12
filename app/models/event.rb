class Event < ApplicationRecord
  has_event :publish
  has_rich_text :content

  before_save :set_event_day, :if => :new_record?

  scope :today_events, ->(date = Date.today) { where("EXTRACT(month FROM started_at) = ? AND EXTRACT(day FROM started_at) = ?", date.month, date.day )}
  scope :upcoming_events, -> { where("EXTRACT(month FROM started_at) = ? AND EXTRACT(day FROM started_at) = ?", 1.days.from_now.month, 1.days.from_now.day )}
  scope :month_events, ->(date = Date.today) { where("EXTRACT(month FROM started_at) = ?", date.month )}

  def set_event_day
    self.eventday = started_at.yday
  end
end
