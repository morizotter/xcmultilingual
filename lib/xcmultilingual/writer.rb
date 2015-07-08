module Xcmultilingual
  class Writer
    def initialize(options)
      @verbose = options[:verbose]
      @destination = options[:destination]
    end

    def write()
      File.open("#{@destination}", "r+") do |file|
        file.write("That is the text.")
      end

    end
  end
end
