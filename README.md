# Lost My Doorbell - Server
This is a simple Sinatra app which acts a bridge between Slack and the LMN doorbell.

It listens for POST requests on /buzz, and then triggers a Pusher event which is picked up by the listening Raspberry Pi in the office.

## Config
Copy `.env.sample` to `.env` and fill out the empty config values.
