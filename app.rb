require 'bundler'
Bundler.require

# config bits
Dotenv.load
Pusher.url = ENV['PUSHER_URL']
require 'sinatra/reloader' if development?
set :server, 'puma'

# routes
post '/' do
  puts params
  Pusher.trigger('doorbell', 'buzz', nil)
end
