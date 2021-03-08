class EventDecorator < ApplicationDecorator
  delegate_all

  # Define presentation-specific methods here. Helpers are accessed through
  # `helpers` (aka `h`). You can override attributes, for example:
  #
  #   def created_at
  #     helpers.content_tag :span, class: 'time' do
  #       object.created_at.strftime("%a %m/%d/%y")
  #     end
  #   end

  def publication_status
    if published?
      "Unpublish"
    else
      "Publish"
    end
  end

  def publication_icon_status
    if published?
      h.content_tag :span, class: "px-2 py-1 font-semibold leading-tight text-green-700 bg-green-100 rounded-full dark:bg-green-700 dark:text-green-100" do
        "Publish"
      end
    else
      h.content_tag :span, class: "px-2 py-1 font-semibold leading-tight text-red-700 bg-red-100 rounded-full dark:text-red-100 dark:bg-red-700" do
        "Unpublish"
      end
    end
  end
end
