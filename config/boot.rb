require "rubygems"
require "yaml"
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../../Gemfile", __FILE__)
require "bundler/setup" if File.exists?(ENV["BUNDLE_GEMFILE"])
# Modify Rails 4 default IP binding, so that host machines can access the server

require "rails/commands/server"

module Rails
  class Server
    new_default_options = Module.new do
      def default_options
        super.merge(:Host => "0.0.0.0") if Rails.env == "development"
      end
    end
    prepend new_default_options
  end
end
