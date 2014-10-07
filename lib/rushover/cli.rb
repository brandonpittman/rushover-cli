require 'rushover'
require "rushover/cli/version"
require 'slop'
require 'pathname'
require 'yaml/store'

# @author Brandon Pittman
# This module is namespaced as Rushover::Cli in order to show it's connected to
# the rushover gem.
module Rushover
  # This is the CLI for rushover.
  module Cli

    # This class is accessing helper methods used in the bin file.
    class Rush

      # @!group Rushover objects
      # @param app_token [String]
      # @return [Rushover::Client] Client object to be used in #notify
      # @see #notify
      # @since 0.0.2
      def client(app_token)
        Rushover::Client.new(app_token)
      end

      # @param user_key [String]
      # @param client [Rushover::Client]
      # @return [Rushover::User] User object to be used in #notify
      # @see #notify
      # @since 0.0.2
      def user(user_key, client)
        Rushover::User.new(user_key, client)
      end
      # @!endgroup

      # @param user [Rushover::User]
      # @return [Hash] response from Pushover
      # @since 0.0.2
      # @see #user
      # @see #client
      def notify(user)
        user.notify(message, title: opts[:title])
      end

      # @!group Configuration management
      # @return [Pathname] location of .rushrc file
      # @since 0.0.2
      def rc_file
        Pathname.new("#{ENV['HOME']}/.rushrc")
      end

      # @return [Psych::Store] YAML Store consisting of a :user and :rush keys
      # @since 0.0.2
      def config
        YAML::Store.new(rc_file)
      end
      # @!endgroup

      # @!group Key management
      # @param key_symbol [Symbol] symbol to fetch
      # @return [String] value of fetched key
      # @since 0.0.2
      def get_key(key_symbol)
        store = config
        store.transaction do
          store.fetch(key_symbol)
        end
      end

      # @param key_symbol [Symbol] symbol to add
      # @param key_value [String] value to assign to key_symbol
      # @return [Psych::Store] updated YAML Store
      # @since 0.0.2
      # @note Currently not used by rushover-cli
      # @todo Add ability to set :user and :rush keys
      def add_key(key_symbol, key_value)
        store = config
        store.transaction do
          store[key_symbol] = key_value
        end
      end
      # @!endgroup

      # @!group Miscellaneous
      # @return [String] version number of `rushover-cli` as a String
      # @since 0.0.2
      def version
        Rushover::Cli::VERSION
      end
      # @!endgroup

    end
  end
end

