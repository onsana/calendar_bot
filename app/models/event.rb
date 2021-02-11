class Event < ApplicationRecord
  has_event :publish
  has_rich_text :content
end
