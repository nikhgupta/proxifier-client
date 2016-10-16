page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

ignore "vendor/*"

activate :sprockets
sprockets.append_path File.join("#{root}", "bower_components")

activate :external_pipeline,
  name: :riot,
  command: "./node_modules/.bin/riot #{"--watch" unless build?} --whitespace --type coffeescript --style scss --ext html source/templates source/javascripts/templates.js",
  source: "source/javascripts",
  latency: 2

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
end
