require 'bundler'
Bundler.require

# config bits
Dotenv.load
Pusher.url = ENV['PUSHER_URL']
require 'sinatra/reloader' if development?
set :server, 'puma'

# render a simple 'bzzz' button at /
get '/' do
  erb :index
end

# actually buzz the person in if they POST to /buzz
post '/buzz' do
  # ENV['PUSHER_URL']
  Pusher.trigger('doorbell', 'buzz', nil)
end
