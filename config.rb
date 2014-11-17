require 'lib/apiserver'

###
# Blog settings
###

# Time.zone = "UTC"

set :markdown, :tables => true, :autolink => true, :gh_blockcode => true, :fenced_code_blocks => true
set :markdown_engine, :redcarpet

set :social, {
  twitter: "http://twitter.com/wschenk",
  tumblr: "http://sublimeguile.com/",
  instagram: "http://instagram.com/wschenk",
  linkedin: "http://www.linkedin.com/pub/will-schenk/0/266/420/",
  github: "https://github.com/wschenk"
}

set :author, "Will Schenk"
set :siteurl, "http://willschenk.com"
set :disqus_shortname, "willschenk"
set :google_analytics_id, "UA-56296045-1"

activate :meta_tags

activate :blog do |blog|
  # This will add a prefix to all links, template references and source paths
  # blog.prefix = "willschenk.com"

  # blog.permalink = "{year}/{month}/{day}/{title}.html"
  blog.permalink = "{title}.html"
  # Matcher for blog source files
  # blog.sources = "{year}-{month}-{day}-{title}.html"
  # blog.taglink = "tags/{tag}.html"
  # blog.layout = "layout"
  # blog.summary_separator = /(READMORE)/
  # blog.summary_length = 250
  # blog.year_link = "{year}.html"
  # blog.month_link = "{year}/{month}.html"
  # blog.day_link = "{year}/{month}/{day}.html"
  # blog.default_extension = ".markdown"

  blog.tag_template = "tag.html"
  blog.calendar_template = "calendar.html"

  # Enable pagination
  # blog.paginate = true
  # blog.per_page = 10
  # blog.page_link = "page/{num}"
end

activate :directory_indexes
activate :drafts

page "/feed.xml", layout: false
page "/admin/index.html", layout: false

###
# Compass
###

# Change Compass configuration
# compass_config do |config|
#   config.output_style = :compact
# end

###
# Page options, layouts, aliases and proxies
###

# Per-page layout changes:
#
# With no layout
# page "/path/to/file.html", layout: false
#
# With alternative layout
# page "/path/to/file.html", layout: :otherlayout
#
# A path which all have the same layout
# with_layout :admin do
#   page "/admin/*"
# end

# Proxy pages (http://middlemanapp.com/basics/dynamic-pages/)
# proxy "/this-page-has-no-template.html", "/template-file.html", locals: {
#  which_fake_page: "Rendering a fake page with a local variable" }

###
# Helpers
###

# Automatic image dimensions on image_tag helper
# activate :automatic_image_sizes

# Reload the browser automatically whenever files change
# activate :livereload

# Methods defined in the helpers block are available in templates
# helpers do
#   def some_helper
#     "Helping"
#   end
# end

page "CNAME"

set :css_dir, 'stylesheets'

set :js_dir, 'javascripts'

set :images_dir, 'images'

configure :development do
  activate :livereload
end

# Build-specific configuration
configure :build do
  ignore '/admin/*'
  ignore '/stylesheets/admin/*'

  # For example, change the Compass output style for deployment
  activate :minify_css

  # Minify Javascript on build
  activate :minify_javascript

  # Enable cache buster
  activate :asset_hash

  # Use relative URLs
  activate :relative_assets

  # Or use a different image path
  # set :http_prefix, "/willschenk.com/"
end


activate :deploy do |deploy|
  deploy.method = :git
  deploy.build_before = true
end