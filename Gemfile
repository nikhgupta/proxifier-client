# If you do not have OpenSSL installed, change
# the following line to use 'http://'
source 'https://rubygems.org'

# For faster file watcher updates on Windows:
gem 'wdm', '~> 0.1.0', platforms: [:mswin, :mingw]

# Windows does not come with time zone data
gem 'tzinfo-data', platforms: [:mswin, :mingw, :jruby]

# Middleman Gems
gem 'middleman', '>= 4.0.0'
gem 'middleman-livereload'
gem 'middleman-sprockets', '~> 4.0.0.rc.1'

# middleman detects 'less' files in source/pages-framework, and hence,
# asks us to require these gems - there must be a way to ignore those files, but
# for now, the following gems handle this issue.
#
# Moreover, the following did not work inside config.rb:
#   ignore 'pages-framework/*'
gem 'less'
gem 'therubyracer'
