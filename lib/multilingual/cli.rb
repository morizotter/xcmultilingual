require 'multilingual'
require 'thor'

module Multilingual
  class CLI < Thor
    class_option :verbose, :type => :boolean

    desc "hello", "output hello"
    option :from, :aliases => "-f"
    def hello(name)
      p "Output hello" if options[:verbose]
      p "From #{options[:from]}" if options[:from]
      p "Hello #{name}"
      p "End output hello" if options[:verbose]
    end

    desc "update", "update Multilingual swift file"
    option :destination, :aliases => "-d", :required => true
    def update
      p "update #{options[:destination]}"
    end

    # desc "create", "create Multilingual swift file with given path"
    # option :destination, :aliases => "-d", :required => true
    # def create
    #   invoke :update
    # end

  end
end
