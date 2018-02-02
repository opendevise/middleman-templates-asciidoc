require 'middleman-asciidoc'

# = Site properties
# See data/site.yml for seed values
ready do
  site_properties = app.data.site
end

# = Site structure
set :css_dir, 'css'
set :js_dir, 'js'
set :images_dir, 'images'
set :layouts_dir, '_layouts'
set :build_dir, 'public'

# = Template engine config
set :slim, format: :html, sort_attrs: false, pretty: true, disable_escape: true
require 'slim/include'

# = Activate and configure extensions
# See https://middlemanapp.com/advanced/configuration/#configuring-extensions

activate :asciidoc do |asciidoc|
  asciidoc.safe = :unsafe
  # enable layout to use the same layout for all AsciiDoc pages
  #asciidoc.layout = :article
  # enable the following option to customize the HTML templates used to convert AsciiDoc content
  #asciidoc.template_dirs = 'templates'
  # configure the global AsciiDoc attributes here
  attributes = {
    'source-highlighter' => 'coderay',
    'coderay-css' => 'style'
  }
  asciidoc.attributes = attributes
end

# = Layouts
# https://middlemanapp.com/basics/layouts/

# Per-page layout changes
page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

# Page with alternative layout
# page '/path/to/file.html', layout: 'other_layout'

# = Helpers
# See https://middlemanapp.com/basics/helper-methods/
=begin
helpers do
  def some_helper
    'Helping'
  end
end
=end

# = Build-specific configuration
# See https://middlemanapp.com/advanced/configuration/#environment-specific-settings
=begin
configure :build do
  activate :minify_css
  activate :minify_javascript
end
=end
