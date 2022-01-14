SitemapGenerator::Sitemap.default_host = 'https://www.jisakupc-parts.com'
SitemapGenerator::Sitemap.sitemaps_host = "https://s3-ap-northeast-1.amazonaws.com/#{ENV['S3_BUCKET_NAME']}"
SitemapGenerator::Sitemap.sitemaps_path = 'sitemaps/'
SitemapGenerator::Sitemap.adapter = SitemapGenerator::AwsSdkAdapter.new(
  ENV['S3_BUCKET_NAME'],
  aws_access_key_id: ENV['AWS_ACCESS_KEY_ID'],
  aws_secret_access_key: ENV['AWS_SECRET_ACCESS_KEY'],
  aws_region: 'ap-northeast-1',
)

SitemapGenerator::Sitemap.create do
  add root_path, :changefreq => 'daily', :priority => 1.0
  add new_custom_path, :changefreq => 'weekly', :priority => 0.5
end
