source 'http://rubygems.org'
gem 'rails', '3.0.1'

#these next few lines address problems building on ubuntu natty
gem 'bzip2-ruby', :git =>'git://github.com/colindean/bzip2-ruby'
gem 'nokogiri', '~>1.5.0.beta.3'
gem 'ffi', '~>1.0.0'
gem 'gherkin', :git => 'git://github.com/colindean/gherkin'
#end

gem 'pg'

gem 'authlogic', :git => 'git://github.com/odorcicd/authlogic.git', :branch => 'rails3'

gem 'heroku'
gem 'taps'

# XXX Dan custom
gem 'annotate'
gem 'simple_form'
#gem 'rails_tinymce', :git => 'git://github.com/sandipransing/rails_tiny_mce.git'
#gem 'paperclip', :git => 'git://github.com/thoughtbot/paperclip.git'
#gem 'will_paginate', :git => 'git://github.com/mislav/will_paginate.git'
gem 'will_paginate', '~> 3.0.beta'
gem 'aws-s3'

#i18n stuff
gem "fast_gettext", :git => 'git://github.com/grosser/fast_gettext.git'
#gem '>=1.9.3', "gettext", :require => false
#gem "gettext",">=1.9.3", :require => false
gem 'gettext', :git => 'git://github.com/colindean/gettext.git' #fixes Config deprecation warnings
gem 'gettext_i18n_rails', :git => 'git://github.com/grosser/gettext_i18n_rails.git'

#payment stuff
gem 'activemerchant'
gem 'money'

#for permissions
gem 'acts_as_tree', :git => "git://github.com/parasew/acts_as_tree.git"

#jquery uber alles
gem 'jquery-rails'

group :development,:test do
  gem 'factory_girl_rails'
  gem 'watchr'
  gem 'sqlite3-ruby', :require => 'sqlite3'
  gem 'capybara'
  gem 'cucumber', :git => 'git://github.com/colindean/cucumber.git' #fixes Config deprecation warnings
  gem 'rspec', '~>2.0.0.beta.20'
  gem 'rspec-rails', '~>2.0.0.beta.20'
  gem 'cucumber-rails'
  gem 'spork'
end

#app-specific stuff
gem 'steam-condenser' #http://koraktor.github.com/steam-condenser
