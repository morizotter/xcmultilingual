module Xcmultilingual
  class Writer
    def initialize(options)
      @verbose = options[:verbose]
      @destination = options[:destination]
    end

    def write()
      puts "+ UPDATING FILES" if @verbose

      if !File.exist?("#{@destination}")
        puts "  There is no destination file."
        return
      end

      File.open("#{@destination}", "r+") do |file|
        file.write("That is the text.")
      end

    end
  end
end
