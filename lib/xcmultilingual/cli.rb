require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update DESTINATION", "update xcmultilingual swift file"
    option :name, :aliases => "-n", :default => "Multilingual", :desc => "Localization struct name"
    option :template_path, :aliases => "-t", :desc => "User generated template file path"
    def update(destination)
      parser = Parser.new(destination)
      parser.verbose = options[:verbose] || false
      bundle_data = parser.parse

      writer = Writer.new(destination, bundle_data)
      writer.name = options[:name]
      writer.template_path = options[:template_path] if options[:template_path]
      writer.verbose = options[:verbose] || false
      writer.write

      puts ""
      puts "+++ DONE ++++++++++++++++++++++++"
      puts ""
      puts "  See #{destination}"
      puts ""
      puts "+++++++++++++++++++++++++++++++++"
      puts ""
    end

    map %w[--version -v] => :__print_version

    desc "--version, -v", "print the version"
    def __print_version
      puts Xcmultilingual::VERSION
    end
  end
end
