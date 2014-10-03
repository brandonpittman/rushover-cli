require "rushover/cli/version"
require 'rushover'
require 'slop'

module Rushover
  module Cli
    client = Rushover::Client.new(app_token)
    user = Rushover::User.new(user_key, client)
    user.notify(message, title: title )
  end
end
