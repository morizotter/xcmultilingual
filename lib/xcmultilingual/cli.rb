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
      puts "update #{options[:destination]}"
      parser = Parser.new(options)
      multilingual = parser.parse
      puts "multilngual: #{multilingual}" # multilngual: [{:Localizable=>#<Set: {"\"HELLO\""}>}, {:Main=>#<Set: {"\"LIZARD\"", "\"DOOR\""}>}]
      writer = Writer.new(options)
      writer.write
    end
  end
end
