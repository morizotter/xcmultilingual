require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true, :desc => "generating file destination"
    option :name, :aliases => "-n", :default => "Multilingual", :desc => "Localization struct name"
    def update
      parser = Parser.new(options[:destination])
      parser.verbose = options[:verbose] || false
      bundle_data = parser.parse

      writer = Writer.new(options[:destination], bundle_data)
      writer.name = options[:name]
      writer.verbose = options[:verbose] || false
      writer.write

      puts "+ DONE" if options[:verbose]
      puts "" if options[:verbose]
      puts "  See #{options[:destination]}" if options[:verbose]
      puts "" if options[:verbose]
    end
  end
end
