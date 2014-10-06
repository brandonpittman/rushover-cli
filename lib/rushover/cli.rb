require 'rushover'
require "rushover/cli/version"
require 'slop'
require 'pathname'
require 'yaml/store'

module Rushover
  module Cli

    class Rush

      def client(app_token)
        Rushover::Client.new(app_token)
      end

      def user(user_key, client)
        Rushover::User.new(user_key, client)
      end

      def notify(user)
        user.notify(message, title: opts[:title])
      end

      def rc_file
        Pathname.new("#{ENV['HOME']}/.rushrc")
      end

      def config
        YAML::Store.new(rc_file)
      end

      def get_key(key_symbol)
        store = config
        store.transaction do
          store.fetch(key_symbol)
        end
      end

      def add_key(key_symbol, key_value)
        store = config
        store.transaction do
          store[key_symbol] = key_value
        end
      end

      def version
        Rushover::Cli::VERSION
      end

    end
  end
end

