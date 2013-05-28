# Set up gems listed in the Gemfile.
# See: http://gembundler.com/bundler_setup.html
#      http://stackoverflow.com/questions/7243486/why-do-you-need-require-bundler-setup
ENV['BUNDLE_GEMFILE'] ||= File.expand_path('../../Gemfile', __FILE__)

require 'bundler/setup' if File.exists?(ENV['BUNDLE_GEMFILE'])

# Require gems we care about
require 'rubygems'

require 'uri'
require 'pathname'

require 'pg'
require 'active_record'
require 'logger'

require 'sinatra'
require 'shotgun'

require 'erb'

require 'oauth'
require 'twitter'

# Some helper constants for path-centric logic
APP_ROOT = Pathname.new(File.expand_path('../../', __FILE__))

APP_NAME = APP_ROOT.basename.to_s

# Set up the controllers and helpers
Dir[APP_ROOT.join('app', 'controllers', '*.rb')].each { |file| require file }
Dir[APP_ROOT.join('app', 'helpers', '*.rb')].each { |file| require file }

# Set up the database and models
require APP_ROOT.join('config', 'database')

Twitter.configure do |config|
  config.consumer_key = ENV['TWITTER_KEY']
  config.consumer_secret = ENV['TWITTER_SECRET']
end

# Twitter.configure do |config|
#   config.consumer_key = 'pshqFbuW1ut990xLVZ7w'
#   config.consumer_secret = 'pUHLYvYKJeuh3ZTyMGdAnSCGdGMGVMJKrZQqDFhU90'
#   config.oauth_token = '249189933-qM8x4VB7X2UZDnSeAWqDURGIjbmdCGmHfPoKapkG'
#   config.oauth_token_secret = 'sNwI9MEjr7t33NVPFEYVIKbMMK8mN6i0mgnb6oVyt8'
# end

# export TWITTER_KEY='pshqFbuW1ut990xLVZ7w'
# export TWITTER_SECRET='pUHLYvYKJeuh3ZTyMGdAnSCGdGMGVMJKrZQqDFhU90'
