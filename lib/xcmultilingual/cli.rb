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
      parser = Parser.new(options)
      multilingual = parser.parse
      
      writer = Writer.new(options[:destination], multilingual)
      writer.name = options[:name]
      writer.verbose = options[:verbose]
      writer.write
    end
  end
end
