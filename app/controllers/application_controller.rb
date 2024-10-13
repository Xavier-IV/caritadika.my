class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  # allow_browser versions: :modern
  before_action :set_meta_tag

  private

  def set_meta_tag
    set_meta_tags site: "caritadika.my",
                  title: "Cari Tadika",
                  reverse: true,
                  description: "Caritadika.my is an open-source tool that helps you find nearby kindergartens, nurseries, and daycare centers across Malaysia.",
                  keywords: "kindergarten, nursery, daycare, Malaysia, education",
                  canonical: request.original_url,
                  separator: "|",
                  og: {
                    title: :title,
                    description: :description,
                    type: "website",
                    url: request.original_url,
                    image: view_context.image_url("default-og-image.jpg") # Add a default OpenGraph image
                  },
                  twitter: {
                    card: "summary_large_image",
                    site: request.original_url,
                    title: :title,
                    description: :description,
                    image: view_context.image_url("default-og-image.jpg")
                  }
  end
end
