# Set the host name for URL creation
SitemapGenerator::Sitemap.default_host = "https://caritadika.my"

SitemapGenerator::Sitemap.create do
  # Add the homepage
  add "/", priority: 1.0, changefreq: "daily"
end
