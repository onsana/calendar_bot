module ApplicationHelper
  include Pagy::Frontend
  
  def default_meta_tags
    # TODO: change favicon
    img = image_url("logo-large.png")
    {
      title: "TODO",
      site: "#{Rails.application.class.name.split('::').first}",
      reverse: true,
      description: "TODO",
      keywords: "TODO",
      separator: "&mdash;".html_safe,
      image: img,
      image_src: img,
      og: {
        title: :title,
        type: 'website',
        url: request.url,
        image: :image,
        description: :description
      },
      twitter: { image: :image_src }
    }
  end
end
