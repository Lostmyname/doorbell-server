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
  HTTParty.post(
    ENV['SLACK_WEBHOOK_URL'],
    body: {
      text: "We've opened the door for you, #{params[:user_name]}."
    }.to_json,
    options: {
      headers: {
        'Content-Type' => 'application/json'
      }
    }
  )

  'Opening the pod bay doors...'
end
