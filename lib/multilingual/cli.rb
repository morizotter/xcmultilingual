require 'multilingual'
require 'thor'

module Multilingual
  class CLI < Thor

    desc "red WORD", "red word print"
    option :from
    def hello(name)
      p "From #{options[:from]}" if options[:from]
      p "Hello #{name}"
    end

  end
end
