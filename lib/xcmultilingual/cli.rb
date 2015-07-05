require 'xcmultilingual'
require 'thor'

module Xcmultilingual
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

    desc "update", "update xcmultilingual swift file"
    option :destination, :aliases => "-d", :required => true
    def update
      p "update #{options[:destination]}"
    end

    # desc "create", "create xcmultilingual swift file with given path"
    # option :destination, :aliases => "-d", :required => true
    # def create
    #   invoke :update
    # end

  end
end
