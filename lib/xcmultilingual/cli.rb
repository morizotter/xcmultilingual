require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true
    option :source, :aliases => "-s"
    option :name, :aliases => "-n"
    def update
      parser = Parser.new()
      parser.verbose = options[:verbose] || false
      multilingual = parser.parse

      writer = Writer.new(options[:destination], multilingual)
      writer.name = options[:name] || "Multilingual"
      writer.verbose = options[:verbose] || false
      writer.write
    end
  end
end
