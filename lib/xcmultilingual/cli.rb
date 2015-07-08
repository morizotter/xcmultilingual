require 'xcmultilingual'
require 'thor'
require 'set'

module Xcmultilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true
    option :source, :aliases => "-s"
    def update
      parser = Parser.new(options)
      multilingual = parser.parse
      puts "multilngual: #{multilingual}" #multilngual: [#<struct Struct::Table name="Localizable", keys=["\"HELLO\""]>, #<struct Struct::Table name="Main", keys=["\"LIZARD\"", "\"DOOR\""]>]
      writer = Writer.new(options)
      writer.write
    end
  end
end
