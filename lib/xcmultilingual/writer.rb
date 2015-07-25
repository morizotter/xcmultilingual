require 'erb'
require 'securerandom'

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
      puts "[START UPDATING]" if @verbose

      if !File.exist?("#{@destination}")
        puts "There is no destination file." if @verbose
        puts "\n+ FAILED UPDATING\n" if @verbose
        exit 2
      end

      uuid = SecureRandom.uuid.gsub(/-/,'').upcase

      File.open("#{@destination}", "w") do |file|
        path = File.expand_path(@template_path)
        body = ERB.new(File.open(path).read, nil, '-').result(binding)
        file.write(body)
      end
      puts "[END UPDATING]" if @verbose
    end

    private

    def template_path()
      File.dirname(__FILE__) + '/templates/swift.erb'
    end
  end
end
