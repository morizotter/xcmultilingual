require 'multilingual'
require 'thor'

module Multilingual
  class CLI < Thor
    desc "red WORD", "red word print"
    def red(word)
      say(word, :red)
    end
  end
end
