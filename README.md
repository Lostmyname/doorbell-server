# Lost My Doorbell - Server
This is a simple Sinatra app which acts a bridge between Slack and the LMN doorbell.

It listens for POST requests on /, and then triggers a Pusher event which is picked up by the listening Raspberry Pi in the office.

Check out the [client library](https://github.com/Lostmyname/doorbell-client) for the Raspberry Pi code.

## Getting Started
- Set up two integrations on your Slack account ([here](https://my.slack.com/services)); one for **Incoming Webhooks** and another for **Slash Commands**. Make note of your webhook URL and Slack token.
- Copy `.env.sample` to `.env` and fill out the empty config values.
  - You'll need a `PUSHER_KEY`, `SLACK_TOKEN` and `SLACK_WEBHOOK_URL`
- Deploy this app somewhere - we recommend Heroku - and point your Slack Slash Command integration to it.
- Connect up the client code, and enjoy!
