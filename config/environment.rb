# Be sure to restart your server when you modify this file

# Specifies gem version of Rails to use when vendor/rails is not present
RAILS_GEM_VERSION = '2.3.5' unless defined? RAILS_GEM_VERSION

# Bootstrap the Rails environment, frameworks, and default configuration
require File.join(File.dirname(__FILE__), 'boot')

Rails::Initializer.run do |config|
  # Settings in config/environments/* take precedence over those specified here.
  # Application configuration should go into files in config/initializers
  # -- all .rb files in that directory are automatically loaded.

  # Add additional load paths for your own custom dirs
  # config.load_paths += %W( #{RAILS_ROOT}/extras )

  config.load_paths += %W( #{RAILS_ROOT}/app/middleware )

  # Specify gems that this application depends on and have them installed with rake gems:install
  # config.gem "bj"
  # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
  # config.gem "sqlite3-ruby", :lib => "sqlite3"
  # config.gem "aws-s3", :lib => "aws/s3"

  config.gem 'russian'
  config.gem 'chriseppstein-compass', :lib => 'compass'
  config.gem 'haml'
  config.gem 'paperclip'
  config.gem 'mime-types', :lib => 'mime/types'
  config.gem "tabs_on_rails", :source => "http://gemcutter.org"
  config.gem "will_paginate"
  config.gem 'formtastic'
  config.gem 'authlogic', :version => '2.1.3'
  config.gem 'rack-openid', :version => '0.2.2', :lib => 'rack/openid'
  config.gem 'ruby-openid', :version => '2.1.7', :lib => 'openid'
  #config.gem 'authlogic-oid', :version => '1.0.4', :lib => 'authlogic_openid'

  config.action_mailer.default_url_options = { :host => "woto-netbook" }
  config.action_mailer.smtp_settings = {
    :address  => "woto-netbook",
#    :port  => 25, 
    :domain  => "woto-netbook",
#    :user_name  => "mail@example.com",
#    :password  => "foobar",
#    :authentication  => :login
  }


  # Only load the plugins named here, in the order given (default is alphabetical).
  # :all can be used as a placeholder for all plugins not explicitly named
  # config.plugins = [ :exception_notification, :ssl_requirement, :all ]

  # Skip frameworks you're not going to use. To use Rails without a database,
  # you must remove the Active Record framework.
  # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]

  # Activate observers that should always be running
  # config.active_record.observers = :cacher, :garbage_collector, :forum_observer

  # Set Time.zone default to the specified zone and make Active Record auto-convert to this zone.
  # Run "rake -D time" for a list of tasks for finding time zone names.
  config.time_zone = 'Moscow'

  # The default locale is :en and all translations from config/locales/*.rb,yml are auto loaded.
  # config.i18n.load_path += Dir[Rails.root.join('my', 'locales', '*.{rb,yml}')]
  # config.i18n.default_locale = :de

  config.action_view.field_error_proc = Proc.new do |html_tag, instance|
    if html_tag =~ /<label/
      %|<div class="fieldWithErrors">#{html_tag} <span class="error">#{[instance.error_message].join(', ')}</span></div>|
    else
      html_tag
    end
  end

end
