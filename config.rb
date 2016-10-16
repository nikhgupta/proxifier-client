page '/*.xml', layout: false
page '/*.json', layout: false
page '/*.txt', layout: false

ignore "pages-framework/*"
activate :sprockets

configure :development do
  activate :livereload
end

configure :build do
  activate :minify_css
  activate :minify_javascript
  activate :asset_hash
  activate :gzip
end
