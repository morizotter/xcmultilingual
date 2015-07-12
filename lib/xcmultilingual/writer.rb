require 'erb'

module Xcmultilingual
  class Writer
    attr_accessor :name, :template_path, :verbose

    def initialize(destination, bundle_data)
      @destination = destination
      @bundle_data = bundle_data
      @template_path = template_path()
      @filename = File.basename(@destination)
    end

    def write
      puts "+ START UPDATING\n\n" if @verbose

      if !File.exist?("#{@destination}")
        puts "  There is no destination file." if @verbose
        puts "\n+ FAILED UPDATING\n" if @verbose
        return
      end

      File.open("#{@destination}", "w") do |file|
        path = File.expand_path(@template_path)
        body = ERB.new(File.open(path).read, nil, '-').result(binding)
        file.write(body)
      end
      puts "+ END UPDATING\n\n" if @verbose
    end

    private

    def template_path()
      File.dirname(__FILE__) + '/templates/swift.erb'
    end
  end
end
