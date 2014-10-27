require 'bundler'
Bundler.require

# config bits
Dotenv.load
Pusher.url = ENV['PUSHER_URL']
require 'sinatra/reloader' if development?
set :server, 'puma'

# routes
post '/' do
  halt 401 if params[:token] != ENV['SLACK_TOKEN'] 
  Pusher.trigger('doorbell', 'buzz', nil)
end
