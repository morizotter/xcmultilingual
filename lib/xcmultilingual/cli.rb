require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true
    option :name, :aliases => "-n"
    def update
      parser = Parser.new(options[:destination])
      parser.verbose = options[:verbose] || false
      bundle_data = parser.parse

      writer = Writer.new(options[:destination], bundle_data)
      writer.name = options[:name] || "Multilingual"
      writer.verbose = options[:verbose] || false
      writer.write
    end
  end
end
