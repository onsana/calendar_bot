module ApplicationHelper
  include Pagy::Frontend

  def flash_messages
    capture do
      flash.each do |key, value|
        concat tag.div(
          data: {
            controller: :flash, flash_key: key, flash_value: value
          }
        )
      end
    end
  end

  def default_meta_tags
    # TODO: change favicon
    img = image_url("logo-large.png")
    {
      title: "TODO",
      site: Rails.application.class.name.split("::").first.to_s,
      reverse: true,
      description: "TODO",
      keywords: "TODO",
      separator: "&mdash;".html_safe,
      image: img,
      image_src: img,
      og: {
        title: :title,
        type: "website",
        url: request.url,
        image: :image,
        description: :description
      },
      twitter: {image: :image_src}
    }
  end
end
