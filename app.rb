require 'bundler'
Bundler.require

# config bits
Dotenv.load
set :server, 'puma'
Pusher.app_id = ENV.fetch('PUSHER_APP_ID')
Pusher.key = ENV.fetch('PUSHER_KEY')
Pusher.secret = ENV.fetch('PUSHER_SECRET')
Pusher.cluster = ENV.fetch('PUSHER_CLUSTER')

# routes
post '/' do
  halt 401 if params[:token] != ENV['SLACK_TOKEN']

  Pusher.trigger('doorbell', 'buzz', nil)

  HTTParty.post(
    ENV['SLACK_WEBHOOK_URL'],
    body: {
      text: [
        "#{params[:user_name]} gave me a buzz.",
        "Gettin’ my buzz on for #{params[:user_name]}!",
        "Buzzing with #{params[:user_name]}.",
        "Who’s buzzing? #{params[:user_name]} is buzzing.",
        "I don’t buzz for anyone. Well, except for #{params[:user_name]}.",
        "Buzz off #{params[:user_name]}!"
      ].sample
    }.to_json,
    options: {
      headers: {
        'Content-Type' => 'application/json'
      }
    }
  )

  'Opening the pod bay doors...'
end
