module ApplicationHelper

  include Pagy::Frontend

  def mobile_device
    agent = request.user_agent
    return "tablet" if agent =~ /(tablet|ipad)|(android(?!.*mobile))/i
    return "mobile" if agent =~ /Mobile/
    return "desktop"
  end

  def devise_image_tag(image, **options)
    attachments[image] = File.read(Rails.root.join("app/assets/images/#{image}"))
    image_tag attachments[image].url, **options
  end

  # def cover_here?(article)
  #   if article.cover.present?
  #     cl_image_tag article.cover, height: 300, width: 400, crop: :fit
  #   else
  #     image_tag 'default.jpg'
  #   end
  # end

end
